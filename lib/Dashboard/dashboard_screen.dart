
import 'dart:convert';
import 'dart:io';
import 'package:adani/Dashboard/Accessories_screen.dart';
import 'package:adani/Dashboard/Breakdown_screen.dart';
import 'package:adani/Dashboard/Consumables_Screen.dart';
import 'package:adani/Dashboard/PredefinedKits_Screen.dart';
import 'package:adani/Dashboard/asset_image_screen.dart';
import 'package:adani/Dashboard/assets_transfer_requests.dart';
import 'package:adani/Dashboard/db/sqlite_service.dart';
import 'package:adani/Dashboard/inspection_details_screen.dart';
import 'package:adani/Dashboard/select_company_screen.dart';
import 'package:adani/Utils/Styles.dart';
import 'package:adani/Utils/textfield_style.dart';
import 'package:adani/controllar/Apis.dart';
import 'package:adani/controllar/data_manager.dart';
import 'package:adani/models/Completed.dart';
import 'package:adani/models/Preventive.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../GetXController/LoadDataController.dart';
import '../auth/login_screen.dart';
import '../models/Workorder3.dart';
import 'Asset_Status/assets_status.dart';
import 'CategoryList_screen.dart';
import 'Components_screen.dart';
import 'Licenses_Screen.dart';
import 'Notification_Listpage.dart';
import 'Qrcode.dart';
import 'Setting_screen.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'inspection_first.dart';
import 'package:http/http.dart' as http;

class Dashboard extends StatefulWidget {
  String?from;
  int?index;
  Dashboard({Key? key, required this.index, this.from}) : super(key: key);



  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with SingleTickerProviderStateMixin
{
  final scrollController = ScrollController();
  final controller = Get.put(LoadController());

  late int limit, offset;
  bool ispullrefresh=false;

  late num total_count;
  String str_total_cnt="";
  String version="";
  late String buildNumber;
  bool isLoadingMore = false;

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  //List<PreventiveScheduleData> preventiveScheduleData=[];
  String noDataFound='';
  String noDataFound1='';
  bool loading = false;
  String today = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String todayTime = DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now());

  TextEditingController dateController = TextEditingController();
  TextEditingController dateController1 = TextEditingController();
  List<CompletedScheduleData> completedScheduleData=[];

  DateTime? currentBackPressTime;
  TabController? _tapController;
  int? tableStatus;
  List<PreventiveScheduleData> res = [];
  List workorders = [];
  List<CompletedScheduleData> resComplete = [];

  // Fetching the first 20 posts
  int _offsetdb = 20;

  late SharedPreferences prefs;
  //String today = DateFormat('yyyy-MM-dd').format(DateTime.now());
 // String todayTime = DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now());



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initalizePref();

    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      String appName = packageInfo.appName;
      String packageName = packageInfo.packageName;
      setState(() {
        version = packageInfo.version;
      });
      buildNumber = packageInfo.buildNumber;
    });

    scrollController.addListener(_scrollListner);

    _tapController?.index = widget.index!;
    dateController1.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
    noDataFound = 'Loading...';
    noDataFound1 = 'Loading...';

   //loadToWorkorders();
    Get.find<LoadController>().load_test();


    if(widget.from == 'companyPage')
    {
      if (DataManager.getInstance().getConnection()) {

        limit=20;
        offset=0;

        loadToLocal();
        loadCompletedToLocal();

        // Api().getCompletedSchedule(
        //   date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
        //   userId: DataManager.getInstance().getUserId(),
        //   domain: DataManager.getInstance().getCompanyDomain(),
        // );
      }
      else {
        //load();
        Get.find<LoadController>().load();
        loadCompleted(dateController1.text);
      }
    }

    else{
      //load(); /* default code earlier */
      Get.find<LoadController>().load();
      if(widget.index==2) {
        loadCompleted(dateController1.text);
      }

    }

  }



  initalizePref() async
  {
    prefs = await SharedPreferences.getInstance();
    bool? is_paramget = prefs.getBool("is_paramget");
    if(is_paramget==true)
    {
      prefs.setBool("is_paramget", false);
      //await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Notification_List(),));
    }

  }

  Future<void> getWorkOrders({domain,cid,token}) async
  {
    dbHelper().getDb()!.then((value) {
      value.rawDelete("DELETE FROM Workorders");
      value.rawDelete("DELETE FROM WoSupporters");
      value.rawDelete("DELETE FROM WoCauses");
      value.rawDelete("DELETE FROM WoMedia");
      value.rawDelete("DELETE FROM WoParameters");
      value.rawDelete("DELETE FROM WoParamconfig");
    });

    var data;
    //var ctime = DateTime.now();
    final response = await http.get(
      /*Uri.parse("${domain}maintenance/workorders/index")*/
      Uri.parse("https://zrclive.sysmatech.com/api/v1/maintenance/workorders/index") ,
      headers: {"Authorization":"Bearer $token","Accept":"application/json"},
      /*body: {
        //"limit": limit,
        //"offset": offset
        //"maintenance_type": "preventive"
      },*/
    );

    var lctime = DateTime.now();
    try {
      //print("===========response call ================");
      //print("response=>===="+response.body);
      //print("===========response call end ================");

      data = jsonDecode(response.body);
      //print("time difference -${ctime}, ${lctime}");
      //print(lctime.second-ctime.second);

    }catch(e){
      print("Error comming");
      throw Exception('Error on server');
    }
    //data = jsonDecode(response.body);
    var jsonData = jsonDecode(response.body);
    workorders =  jsonData['rows'];

    await dbHelper().getDb()!.then((value) {
      value.transaction((txn) async {
        var batch1 = txn.batch();
        var batch2 = txn.batch();
        var batch3 = txn.batch();
        var batch4 = txn.batch();
        var batch5 = txn.batch();

        for(int i=0; i<workorders.length; i++)
        {
          var insertData = {
            // 'sId': res[i].id,
            'workorders_id': workorders[i]['id'],
            'ticket_id': workorders[i]['ticket_id'],
            'title': workorders[i]['title'],
            'due_date': workorders[i]['due_date']['date'],
            'description': workorders[i]['description'],
            'priority_id': workorders[i]['priority_id'],
            'priority': workorders[i]['priority'],
            'category_id': workorders[i]['selected_category']['id'],
            'category': workorders[i]['selected_category']['text'],
            'assignee_id': workorders[i]['selected_assignee']['id'],
            'assignee_name': workorders[i]['selected_assignee']['text'],
            'status_id': workorders[i]['selected_status']['id'],
            'status_text': workorders[i]['selected_status']['text'],
            // 'location': workorders[i]['selected_location']['text'],
            'created_at': workorders[i]['created_at']['formatted'],
            'updated_at': workorders[i]['updated_at']['formatted'],
          };

          batch1.insert('Workorders', insertData);

          if(workorders[i]['selected_causes'].length > 0)
          {
            for (int j = 0; j < workorders[i]['selected_causes'].length; j++)
            {
              var insertData_c = {
                // 'sId': res[i].id,
                'workorders_id': workorders[i]['id'],
                'wocauses_id': workorders[i]['selected_causes'][j]['id'],
                'name': workorders[i]['selected_causes'][j]['text'],
                'cause_name': workorders[i]['selected_causes'][j]['cause_name']
              };
              batch2.insert('WoCauses', insertData_c);
            }
          }

          if(workorders[i]['media'].length > 0)
          {
            for (int j = 0; j < workorders[i]['media'].length; j++)
            {
              var insertData_m = {
                // 'sId': res[i].id,
                'workorders_id': workorders[i]['id'],
                'womedias_id': workorders[i]['media'][j]['id'],
                'name': workorders[i]['media'][j]['name'],
                'url': workorders[i]['media'][j]['url']
              };
              batch3.insert('WoMedia', insertData_m);
            }
          }

          if(workorders[i]['checklist']['parameters'].length > 0)
          {
            for (int j = 0; j < workorders[i]['checklist']['parameters'].length; j++)
            {
              var insertData_parameter = {
                // 'sId': res[i].id,
                'workorders_id': workorders[i]['id'],
                'woparameters_id': workorders[i]['checklist']['parameters'][j]['id'],
                'param_disp_name': workorders[i]['checklist']['parameters'][j]['param_disp_name'],
                'param_type': workorders[i]['checklist']['parameters'][j]['param_type'],
                'is_inspected': workorders[i]['checklist']['parameters'][j]['is_inspected'],
              };
              batch4.insert('WoParameters', insertData_parameter);


               if(workorders[i]['checklist']['parameters'][j]['param_type'] == "Number")
               {
                 var insertData_paramconfig = {
                   'woparameters_id': workorders[i]['checklist']['parameters'][j]['id'],
                   'b_range_low': workorders[i]['checklist']['parameters'][j]['param_config']['benchmark_range_low'],
                   'b_range_high': workorders[i]['checklist']['parameters'][j]['param_config']['benchmark_range_high'],
                   'dropval_aphotos': workorders[i]['checklist']['parameters'][j]['param_config']['dropdown_values_accept_photos_validation'],
                   'dropval_acomment': workorders[i]['checklist']['parameters'][j]['param_config']['dropdown_values_accept_comment_validation'],
                   'dropval_rphotos': workorders[i]['checklist']['parameters'][j]['param_config']['dropdown_values_reject_photos_validation'],
                   'dropval_rcomment': workorders[i]['checklist']['parameters'][j]['param_config']['dropdown_values_reject_comment_validation'],
                 };
                 batch5.insert('WoParamconfig', insertData_paramconfig);
               }
               else if(workorders[i]['checklist']['parameters'][j]['param_type'] == "Drop-down")
               {
                 if(workorders[i]['checklist']['parameters'][j]['param_config'].length > 0)
                 {
                   for (int k = 0; k < workorders[i]['checklist']['parameters'].length; k++)
                   {
                     var insertData_paramconfig = {
                       // 'sId': res[i].id,
                       'woparameters_id': workorders[i]['checklist']['parameters'][j]['id'],
                       'woparamconfig_id': workorders[i]['checklist']['parameters'][j]['param_config'][k]['id'],
                       'type': workorders[i]['checklist']['parameters'][j]['param_config'][k]['type'],
                       'key': workorders[i]['checklist']['parameters'][j]['param_config'][k]['key'],
                       'value': workorders[i]['checklist']['parameters'][j]['param_config'][k]['value'],
                       'photos': workorders[i]['checklist']['parameters'][j]['param_config'][k]['photos'],
                       'comment': workorders[i]['checklist']['parameters'][j]['param_config'][k]['comment']
                     };
                       batch5.insert('WoParamconfig', insertData_paramconfig);
                   }
                 }
               }
            }
          }

        }
        await batch1.commit();
        await batch2.commit();
        await batch3.commit();
        await batch4.commit();
        await batch5.commit();

        });
    });


  }

  loadToWorkorders(){
    //print(DataManager.getInstance().getCompanyDomain().toString());
    getWorkOrders(
      token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI1IiwianRpIjoiM2VhODljYWE4YzdjMWQ2YTgyNjAyYmE1MjA1NzI2NDQ0MmZiNTNhNjczMDU4Zjg1MTIyYTVjMmU0YzA0YWVlNzBkMjdjMDNlMWM1MjBmNjUiLCJpYXQiOjE2NjgxNDgxMzEsIm5iZiI6MTY2ODE0ODEzMSwiZXhwIjoyMTQxNTMzNzMxLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.ITj6NaujUQSBjUyNssb9eakuXSiqQaGqRbrCWywp0yLykiZCVOllVpM1zIi5R6H218sa8uPY8TKVhn32nIvoAHfBmBl4qnBvrmnuJVHkVSfYC6qqBBuU3bXRw6kK5e7IhDtORJcHNxuEXpz8uu8DjsbMln2fnz6rxuI7af7579-cyyfvkBP-GMU9-wecV2jaiyXZHIy1B_N6DKQ7IakQ-X96F2qNU1hNEYpWQDu756DI17LN-GQ6GeHK5JAaWY3Vc52a3pDdJpDFk7-eFLBomOKok5rQO4TUoLxa4_rUAblGASNNXYijtXYGntjyiw_ma2UDfoavZ4s0G_o3x86Mq3Wx-o9xIUGGPU4bqLFNX7APdezSmULEnnH7LDuJlrFN1wBP49gWFxs6q7I3s44XveLtHQEc_nrlhkkju_VYIOBGjsxTiXGOoRuFBUaJ4rXHsP4sWCNDwohugzaW1REk35gEDYBKX4toxGPi6QN0WK109IaLEufU8o8hct8-2OoIPRFkIv9IE--lqqYMXogxJ_F6bVjzsIONZ3xBGrWXzyQ8JBbvbpxKKbe1ZDooA8qFN7s_DqdRmOS88x7WZi6r5raVHKycpMGkmcNwo2VjMEiHC4nVA_AEEB9L457Z83-GO2KMiRWejesVZrGrZPWE2muA0gnq2NPGLaqy-gfIn9s",
      domain: DataManager.getInstance().getCompanyDomain().toString(),
      cid: DataManager.getInstance().getCompanyId().toString(),
      //limit: limit.toString(),
      //offset: offset.toString(),

    ).then((value) async {
     // print(value);
      //var jsonData = jsonDecode(value.body);
      //workorders =  jsonData['rows'];
      setState(() {

        //workorders =  jsonData['rows'];
        noDataFound = 'Loading...';
      });

    });
  }

  loadToLocal(){
    //print(DataManager.getInstance().getCompanyDomain().toString());
    Api().getPreventiveSchedule_2(
      token: DataManager.getInstance().getCompanyToken().toString(),
      userId: DataManager.getInstance().getUserId().toString(),
      domain: DataManager.getInstance().getCompanyDomain().toString(),
      cid: DataManager.getInstance().getCompanyId().toString(),


    ).then((value) async {
      // print(value.totalAssetScheduledata);
      setState(() {
        total_count = value.total!;
        prefs.setInt("totalcount", total_count.toInt());

        //total_count = int.parse(str as String);
        res = value.totalAssetScheduledata!;
        noDataFound = 'Loading...';
      });
      await dbHelper().getDb()!.then((value) {
        value.transaction((txn) async {
          var batch1 = txn.batch();
          var batch2 = txn.batch();
          // print('total schedules');
          // print(res.length);

          for(int i=0; i<res.length; i++)
          {
            var insertData = {
              // 'sId': res[i].id,
              'auditSchduleId': res[i].auditSchduleId,
              // 'companyId': res[i].companyId,
              'assetTagId': res[i].assetTagId,
              // 'userId': res[i].userId ?? 0,
              'auditName': res[i].auditName,
              'auditStatus': res[i].auditStatus,
              'image': res[i].image,
              'assetImage': res[i].assetImage,
              'modelName': res[i].modelName,
              'assetTag': res[i].assetTag,
              'location': res[i].location ?? ' ',
              'auditStartDate': res[i].auditStartDate,
              'auditEndDate': res[i].auditEndDate,
              // 'lastAuditDate': res[i].lastAuditDate,
              'scheduleExpireDate': res[i].scheduleExpireDate,
              'escalatedAuditLevels': res[i].escalatedAuditLevels ?? 0,
              'maintenanceType': res[i].maintenanceType,
              'companyName': res[i].companyName ?? ' ',
              'categoryName': res[i].categoryName ?? ' ',
              'purchaseDate': res[i].purchaseDate ?? ' ',
              'supplierName': res[i].supplierName ?? ' ',
              'warrantyMonths': res[i].warrantyMonths ?? 0,
              'canCheckout': res[i].canCheckout,
              'canCheckin': res[i].canCheckin,
              // 'auditParamsId': res[i].auditParamsId,
              'auditParamsValues': jsonEncode(res[i].auditParamsValues),
              'statusLabel': res[i].statusLabel ?? '',
              'dueDate': res[i].dueDate ?? ''
            };

            batch1.insert('Schedule', insertData);

            for (int h = 0; h < res[i].pmHistory!.length; h++)
            {
              var insertPmHistory = {
                'auditSchduleId': res[i].auditSchduleId,
                'assetTagId': res[i].pmHistory![h].assetTagId,
                'auditResult': res[i].pmHistory![h].auditResult,
                'auditInspectionDate': res[i].pmHistory![h]
                    .auditInspectionDate,
                'auditName': res[i].pmHistory![h].auditName
              };
              batch2.insert('PMHistory', insertPmHistory);
            }
          }
          List<Object?> isUpload = await batch1.commit();
          await batch2.commit();
          // print('data uploaded');
          // print(isUpload);
          if(isUpload.isNotEmpty){
            // load();
            // Future.delayed(const Duration(seconds: 3),() => load(),);
          }else{
            setState(() {
              noDataFound ='No Data Available!';
            });
          }
        });
      }).whenComplete(() =>
        Get.find<LoadController>().load()//after insert all show record

      );
    });
  }

  loadToLocal_2(int limit, int offset)
  {
    Api().getPreventiveSchedule(
      token: DataManager.getInstance().getCompanyToken().toString(),
      userId: DataManager.getInstance().getUserId().toString(),
      domain: DataManager.getInstance().getCompanyDomain().toString(),
      cid: DataManager.getInstance().getCompanyId().toString(),
      limit: limit.toString(),
      offset: offset.toString(),

    ).then((value) async {
      // print(value.totalAssetScheduledata);
      setState(() {
        total_count = value.total!;
        //total_count = int.parse(str as String);
        res = value.totalAssetScheduledata!;
        noDataFound = 'Loading...';
      });
      await dbHelper().getDb()!.then((value) {
        value.transaction((txn) async {
          var batch1 = txn.batch();
          var batch2 = txn.batch();
          // print('total schedules');
          // print(res.length);

          for(int i=0; i<res.length; i++)
          {
            print(res[i].auditName);

            var insertData = {
              // 'sId': res[i].id,
              'auditSchduleId': res[i].auditSchduleId,
              // 'companyId': res[i].companyId,
              'assetTagId': res[i].assetTagId,
              // 'userId': res[i].userId ?? 0,
              'auditName': res[i].auditName,
              'auditStatus': res[i].auditStatus,
              'image': res[i].image,
              'assetImage': res[i].assetImage,
              'modelName': res[i].modelName,
              'assetTag': res[i].assetTag,
              'location': res[i].location ?? ' ',
              'auditStartDate': res[i].auditStartDate,
              'auditEndDate': res[i].auditEndDate,
              // 'lastAuditDate': res[i].lastAuditDate,
              'scheduleExpireDate': res[i].scheduleExpireDate,
              'escalatedAuditLevels': res[i].escalatedAuditLevels ?? 0,
              'maintenanceType': res[i].maintenanceType,
              'companyName': res[i].companyName ?? ' ',
              'categoryName': res[i].categoryName ?? ' ',
              'purchaseDate': res[i].purchaseDate ?? ' ',
              'supplierName': res[i].supplierName ?? ' ',
              'warrantyMonths': res[i].warrantyMonths ?? 0,
              'canCheckout': res[i].canCheckout,
              'canCheckin': res[i].canCheckin,
              // 'auditParamsId': res[i].auditParamsId,
              'auditParamsValues': jsonEncode(res[i].auditParamsValues),
              'statusLabel': res[i].statusLabel ?? '',
              'dueDate': res[i].dueDate ?? ''
            };
            batch1.insert('Schedule', insertData);
            for (int h = 0; h < res[i].pmHistory!.length; h++)
            {
              var insertPmHistory = {
                'auditSchduleId': res[i].auditSchduleId,
                'assetTagId': res[i].pmHistory![h].assetTagId,
                'auditResult': res[i].pmHistory![h].auditResult,
                'auditInspectionDate': res[i].pmHistory![h]
                    .auditInspectionDate,
                'auditName': res[i].pmHistory![h].auditName
              };
              batch2.insert('PMHistory', insertPmHistory);
            }
          }
          List<Object?> isUpload = await batch1.commit();
          await batch2.commit();
          // print('data uploaded');
          // print(isUpload);
          if(isUpload.isNotEmpty){
            // load();
            // Future.delayed(const Duration(seconds: 3),() => load(),);
          }else{
            setState(() {
              noDataFound ='No Data Available!';
            });
          }
        });
      }).whenComplete(() =>
          Get.find<LoadController>().load()//after insert all show record
        //callfun()
      );
    });
  }

  loadCompletedToLocal(){
    Api().getCompletedSchedule(
      date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
      userId: DataManager.getInstance().getUserId(),
      domain: DataManager.getInstance().getCompanyDomain(),
    ).then((value) async {
      setState(() {
        resComplete = value.totalAssetScheduledata!;
        noDataFound1 = 'Loading...';
      });
      await dbHelper().getDb()!.then((value) {
        value.transaction((txn) async {
          var batch = txn.batch();
          for (int i = 0; i < resComplete.length; i++) {
            var insertData = {
              'auditSchduleId': resComplete[i].auditSchduleId,
              'assetTagId': resComplete[i].assetTagId,
              'auditName': resComplete[i].auditName,
              'auditStatus': resComplete[i].auditStatus,
              'image': resComplete[i].image,
              'assetImage': resComplete[i].assetImage,
              'modelName': resComplete[i].modelName,
              'assetTag': resComplete[i].assetTag,
              'location': resComplete[i].location ?? ' ',
              'auditEndDate': resComplete[i].auditEndDate,
              'auditInspectionDate': resComplete[i].auditInspectionDate,
              'auditInspectionDateF':DateFormat("yyyy-MM-dd").format(DateTime.parse(resComplete[i].auditInspectionDate.toString())),
              'scheduleExpireDate': resComplete[i].scheduleExpireDate != null
                  ? DateFormat("yyyy-MM-dd")
                  .format(
                  DateTime.parse(resComplete[i].scheduleExpireDate.toString()))
                  .toString()
                  : "0000-00-00",
              'escalatedAuditLevels': resComplete[i].escalatedAuditLevels ?? 0,
              'maintenanceType': resComplete[i].maintenanceType,
              'companyName': resComplete[i].companyName ?? ' ',
              'categoryName': resComplete[i].categoryName ?? ' ',
              'purchaseDate': resComplete[i].purchaseDate ?? ' ',
              'lastAuditDate': resComplete[i].lastAuditDate ?? ' ',
              'supplierName': resComplete[i].supplierName ?? ' ',
              'warrantyMonths': resComplete[i].warrantyMonths ?? 0,
              'canCheckout': 0,
              'canCheckin': 0,
              'auditParamsValues': jsonEncode(resComplete[i].auditParamsValues),
              'auditParamsTransaction': jsonEncode(resComplete[i].auditParamsTransaction),
              'inspectionBy': resComplete[i].inspectionBy,
              'status':1,
              'insFrom':1,
              'response':'',
              'userId':DataManager.getInstance().getUserId()
            };
            batch.insert('CompletedSchedule', insertData);
          }
          List<Object?> isUpload = await batch.commit();
          // print('data uploaded');
          // print(isUpload);
          if(isUpload.isEmpty){
            setState(() {
              noDataFound1 ='No Data Available!';
            });
          }else{
            loadCompleted(dateController1.text);
          }
        });
      }).whenComplete(() => loadCompleted(dateController1.text));
    });
  }

  /*Future<List<PreventiveScheduleData>> load() async {
    // preventiveScheduleData.clear();
    loadPreventiveLocal().then((value){
       setState(() {
          preventiveScheduleData = value;
        });

    });
    return preventiveScheduleData;
  }*/

  Future<List<PreventiveScheduleData>> loadPreventiveLocal() async{
    List<PreventiveScheduleData> preventiveScheduleData1=[];
    dbHelper().getDb()!.then((value) {
      value.rawQuery("SELECT * From 'Schedule' WHERE maintenanceType == 'preventive' AND auditStatus != 'completed' OR scheduleExpireDate >= '$todayTime'").then((value) {
        for (var i in value){
          try {
            preventiveScheduleData1.add(PreventiveScheduleData(
              // id : num.parse(i['sId'].toString()),
              auditSchduleId: num.parse(i['auditSchduleId'].toString()),
              // companyId: num.parse(i['companyId'].toString()),
              assetTagId: num.parse(i['assetTagId'].toString()),
              // userId: num.parse(i['userId'].toString()),
              auditName: i['auditName'].toString(),
              auditStatus: i['auditStatus'].toString(),
              image: i['image'].toString(),
              assetImage: i['assetImage'].toString(),
              modelName: i['modelName'].toString(),
              assetTag: i['assetTag'].toString(),
              location: i['location'].toString(),
              auditEndDate: i['auditEndDate'].toString(),
              auditStartDate: i['auditStartDate'].toString(),
              // lastAuditDate: i['lastAuditDate'].toString(),
              scheduleExpireDate: i['scheduleExpireDate'].toString(),
              escalatedAuditLevels: i['escalatedAuditLevels'].toString(),
              maintenanceType: i['maintenanceType'].toString(),
              companyName: i['companyName'].toString(),
              categoryName: i['categoryName'].toString(),
              purchaseDate: i['purchaseDate'].toString() ?? ' ',
              supplierName: i['supplierName'].toString(),
              warrantyMonths: num.parse(i['warrantyMonths'].toString()),
              canCheckout: i['canCheckout'] != null ? num.parse(
                  i['canCheckout'].toString()) : 0,
              canCheckin: i['canCheckin'] != null ? num.parse(
                  i['canCheckin'].toString()) : 0,
              // auditParamsId:num.parse(i['auditParamsId'].toString()),
              auditParamsValues: jsonDecode(i['auditParamsValues'].toString()),
              statusLabel: i['statusLabel'].toString(),
              dueDate: i['dueDate'].toString(),
            ));
          }catch(e){
            print(e);
          }
        }
      });
    });
    return preventiveScheduleData1;
  }

  Future<List<CompletedScheduleData>> loadCompleted(date) async {
    completedScheduleData.clear();
    loadCompletedLocal(date).then((value){
      setState(() {
        completedScheduleData = value;
      });
      Future.delayed(const Duration(seconds: 1),() {
        if(value.isEmpty){
          setState(() {
            noDataFound1 ='No Data Available!';
          });
        }else{
          setState(() {
            noDataFound1 ='Loading...';
          });
        }
      },);
    });
    return completedScheduleData;
  }

  Future<List<CompletedScheduleData>> loadCompletedLocal(date) async{
    List<CompletedScheduleData> completedScheduleData1=[];
    dbHelper().getDb()!.then((dbValue) {
      dbValue.rawQuery("SELECT * FROM CompletedSchedule WHERE auditInspectionDateF == '$date' AND userId == '${DataManager.getInstance().getUserId()}'").then((value) {
        for (var i in value) {
          completedScheduleData1.add(CompletedScheduleData(
              auditSchduleId: num.parse(i['auditSchduleId'].toString()),
              assetTagId: num.parse(i['assetTagId'].toString()),
              auditName: i['auditName'].toString(),
              auditStatus: i['auditStatus'].toString(),
              image: i['image'].toString(),
              assetImage: i['assetImage'].toString(),
              modelName: i['modelName'].toString(),
              assetTag: i['assetTag'].toString(),
              location: i['location'].toString(),
              auditEndDate: i['auditEndDate'].toString(),
              auditInspectionDate:i['auditInspectionDate'].toString(),
              scheduleExpireDate: i['scheduleExpireDate'].toString(),
              escalatedAuditLevels: i['escalatedAuditLevels'].toString(),
              maintenanceType: i['maintenanceType'].toString(),
              companyName: i['companyName'].toString(),
              categoryName: i['categoryName'].toString(),
              purchaseDate: i['purchaseDate'].toString() ?? ' ',
              lastAuditDate: i['lastAuditDate'].toString(),
              supplierName: i['supplierName'].toString(),
              warrantyMonths: num.parse(i['warrantyMonths'].toString()),
              auditParamsValues: jsonDecode(
                  i['auditParamsValues'].toString()),
              auditParamsTransaction: num.parse(i['status'].toString()) == 1 && num.parse(i['insFrom'].toString()) == 1 ?jsonDecode(i['auditParamsTransaction'].toString()):i['auditParamsTransaction'],
              inspectionBy: i['inspectionBy'].toString(),
              status: num.parse(i['status'].toString()),
              insFrom:num.parse(i['insFrom'].toString()),
              response: i['response'].toString()
          ));
        }
      });
    });
    return completedScheduleData1;
  }

  Future <void> _scrollListner() async{
    if(scrollController.position.pixels == scrollController.position.maxScrollExtent)
    {
      //print("call api");
      int? totalCount = prefs.getInt("totalcount");
      if(_offsetdb <= totalCount!)
      {
        int rem = totalCount - _offsetdb;
        print("_offsetdb->" +_offsetdb.toString());
        print("total_count->" +totalCount.toString());
        print("rem->" +rem.toString());

        if(rem > 100)
        {
          Get.find<LoadController>().load_2(_offsetdb);//after insert all show record
          _offsetdb = _offsetdb+100;
        }
        else if(rem < 100)
         {
           Get.find<LoadController>().loadPreventiveLocal_3(_offsetdb, rem);
           _offsetdb = _offsetdb+100;
         }
      }
      else{
        print("_offsetdb->" +_offsetdb.toString());
        print("total_count->" +totalCount.toString());
      }

    }
    else{
      //print("don't call api");
    }

  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if(Platform.isAndroid){
          DateTime now = DateTime.now();
          if (currentBackPressTime == null || now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
            currentBackPressTime = now;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text("Press BACK again to exit!"),
                behavior: SnackBarBehavior.floating,
                width: MediaQuery.of(context).size.width*0.8,
              ),
            );
            return Future.value(false);
          }
          return Future.value(true);
        }else{
          return false;
        }
      },
      child: Scaffold(
        appBar:AppBar(
          elevation: 0,
          backgroundColor: white,
          iconTheme: const IconThemeData(color: black),
          title: const Text("Jobs / Work Orders",style: appbartitle,),
          titleSpacing: 0,
          actions:[
            /*Get.find<LoadController>().preventiveScheduleData.isEmpty?
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: InkWell(
                onTap:null,
                child:  Icon(Icons.qr_code_scanner,size: 24,color: Colors.grey,),
              ),
            ):*/
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: InkWell(
                onTap:(){ Get.find<LoadController>().preventiveScheduleData.isEmpty?
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text("Please wait while load company list"),
                    behavior: SnackBarBehavior.floating,
                    width: MediaQuery.of(context).size.width*0.8,
                  ),
                ) :Navigator.push(context, MaterialPageRoute(builder: (context) => const QRcodescan(),));},
                child:  const Icon(Icons.qr_code_scanner,size: 24,),
              ),
            ),
          ],
        ),
        drawer:  Drawer(
          width: MediaQuery.of(context).size.width*0.7,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(color: primarycolor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 60,
                      width: 300,
                      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/logo3.jpg"),fit: BoxFit.fill)),),
                    const SizedBox(height: 20,),
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const select_company(),));
                      },
                      child: Row(
                        children: [
                          Text(DataManager.getInstance().getUserName(),style: wlistTitleHeading,),
                          const SizedBox(width: 10,),
                          const Icon(Icons.navigate_next,color: white,)
                        ],
                      ),
                    ),
                    Text(DataManager.getInstance().getCompanyName(),style: wlistsubHeading,),
                  ],),
              ),
              ListTile(leading: const Icon(Icons.home,color: black,),
                title: const Text("Jobs / Work Orders",style: listHeading,),
                onTap: (){
                  Navigator.pop(context);
                },
              ),
              ListTile(leading: const Icon(Icons.request_page_outlined,color: black,),
                title: const Text("Requests",style: listHeading,),
                // trailing: const Text("5",style: listHeading,),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const AssetsTransferRequests(),));
                },
              ),
              ListTile(leading: const Icon(Icons.keyboard_alt_outlined,color: black,),
                title: const Text("Accessories",style: listHeading,),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Accessories(),));
                },
              ),
              ListTile(leading: const Icon(Icons.keyboard_alt_outlined,color: black,),
                title: const Text("Notification List",style: listHeading,),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  Notification_List(),));
                },
              ),
              ListTile(leading: const Icon(Icons.water_drop,color: black,),
                title: const Text("Consumables",style: listHeading,),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Consumables(),));
                },
              ),
              ListTile(leading: const Icon(Icons.description_outlined,color: black,),
                title: const Text("Licenses",style: listHeading,),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Licenses(),));
                },
              ),
              ListTile(leading: const Icon(Icons.list,color: black,),
                title: const Text("Components",style: listHeading,),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Components(),));
                },
              ),
              ListTile(leading: const Icon(Icons.store_rounded,color: black,),
                title: const Text("Predefined Kits",style: listHeading,),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const predefined_kits(),));
                },
              ),
              ListTile(leading: const Icon(Icons.dashboard_customize,color: black,),
                title: const Text("Category List",style: listHeading,),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const category_list(),));
                },
              ),
              ListTile(leading: const Icon(Icons.construction,color: black,),
                title: const Text("Asset Status",style: listHeading,),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Asset_status()));
                },
              ),
              ListTile(leading: const Icon(Icons.settings,color: black,),
                title: const Text("Settings",style: listHeading,),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Setting(),));
                },
              ),
              ListTile(leading: const Icon(Icons.power_settings_new_outlined,color: black,),
                title: const Text("Logout",style: listHeading,),
                onTap: (){
                  Navigator.pop(context);
                  AwesomeDialog(
                    context: context,
                    dismissOnTouchOutside: false,
                    dialogType: DialogType.warning,
                    animType: AnimType.topSlide,
                    headerAnimationLoop: true,
                    title: 'Logout',
                    titleTextStyle: title,
                    descTextStyle: greysubtext,
                    desc:'Are you sure,do you want to Logout?',
                    btnOkOnPress: () async {
                      SharedPreferences prefs = await SharedPreferences.getInstance();

                      prefs.clear();
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const login(),),(route) => false);
                    },
                    btnOkColor: primarycolor,
                    btnOkText: 'Logout',
                    btnCancelOnPress: () {},
                    btnCancelColor: primarycolor,
                  ).show();
                },
              ),
              ListTile(title: Text("Current version: $version",style: greytext,),
              ),
            ],
          ),
        ),
        backgroundColor: white,
        body: GetBuilder<LoadController>(
            builder: (loadcontroller) {
              return DefaultTabController(
                initialIndex: widget.index!,
                length: 3,
                child: Column(
                  children: [
                    Container(
                      color: const Color(0xFFF6F5F5),
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child:TabBar(
                        controller: _tapController,
                        labelColor: white,
                        isScrollable: false,
                        indicatorWeight: 0.0,
                        unselectedLabelColor: black,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorPadding: EdgeInsets.zero,
                        unselectedLabelStyle: listHeading,
                        labelPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                        padding: EdgeInsets.zero,
                        indicator: const BoxDecoration(color: primarycolor,),
                        onTap: (value) {
                          setState(() {
                            _tapController?.index = value;
                          });
                          if(value == 2){
                            loadCompleted(dateController1.text).then((value){
                              if(value.isEmpty){
                                setState(() {
                                  noDataFound1 ='No Data Available!';
                                });
                              }
                            });
                          }
                        },
                        tabs:<Widget> [
                          Tab(
                            iconMargin: EdgeInsets.zero,
                            child: Row(
                              children: const [
                                Icon(Icons.person,
                                size: 18.0,),
                                SizedBox(width: 3,),
                                Text("Breakdown",
                                style: TextStyle(fontSize: 13)),
                              ],
                            ),
                          ),
                          Tab(
                            icon: Row(
                              children: const [
                                Icon(Icons.person,size: 18.0,),
                                SizedBox(width: 3,),
                                Text("Preventive",style: TextStyle(fontSize: 13)),
                              ],
                            ),
                          ),
                          Tab(
                            icon: Row(
                              children: const [
                                Icon(Icons.person,size: 18.0),
                                SizedBox(width: 3,),
                                Text("Completed",style: TextStyle(fontSize: 13)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: TabBarView(
                        controller: _tapController,
                        children: [
                          const breakdown(),
                          // RefreshIndicator(
                          //   key: _refreshIndicatorKey,
                          //   color: primarycolor,
                          //   strokeWidth: 3.5,
                          //   onRefresh: (){
                          //     return Future.delayed(const Duration(seconds: 1),(){
                          //       if(DataManager.getInstance().getConnection()){
                          //         loadToLocal();
                          //       }else{
                          //         load();
                          //       }
                          //     });
                          //   },
                          //   child:
                          //   preventiveScheduleData.isNotEmpty?
                          //   ListView.builder(
                          //     shrinkWrap: false,
                          //     padding: const EdgeInsets.symmetric(horizontal: 10),
                          //     itemCount: preventiveScheduleData.isNotEmpty?preventiveScheduleData.length:0,
                          //     itemBuilder: (context,index) {
                          //       var data = preventiveScheduleData[index];
                          //       return InkWell(
                          //         onTap: (){
                          //           List<PreventiveScheduleData> temp = [data];
                          //           Navigator.push(context, MaterialPageRoute(builder: (context) => Asset_image(assetScheduleData: temp),));
                          //         },
                          //         child: Container(
                          //           padding: const EdgeInsets.symmetric(vertical: 5.0),
                          //           decoration: const BoxDecoration(
                          //             border: Border(bottom: BorderSide(color: grey_400),),
                          //           ),
                          //           child: Row(
                          //             mainAxisAlignment: MainAxisAlignment.start,
                          //             children: [
                          //               Container(
                          //                 margin: const EdgeInsets.symmetric(horizontal: 10),
                          //                 height: 100,
                          //                 width: 80,
                          //                 child: Center(
                          //                   child: CachedNetworkImage(
                          //                     placeholder: (context, url) => const Image(image: AssetImage('assets/placeholder.png')),
                          //                     imageUrl: '${DataManager.getInstance().getFileUrl()}${data.image}',
                          //                     errorWidget: (context, url, error) => const Image(image: AssetImage('assets/placeholder.png')),
                          //                   ),
                          //                 ),
                          //               ),
                          //               Flexible(
                          //                 child: Column(
                          //                   crossAxisAlignment: CrossAxisAlignment.start,
                          //                   children: [
                          //                     Container(
                          //                       margin:const EdgeInsets.only(left: 0.0),
                          //                       child: Text("${data.auditName}",style: pricolortext,textAlign: TextAlign.left,overflow: TextOverflow.ellipsis,maxLines: 2,),
                          //                     ),
                          //                     Padding(
                          //                       padding: const EdgeInsets.only(left: 5.0),
                          //                       child: Text("${data.modelName} - ${data.assetTag}",style: greytext,),
                          //                     ),
                          //                     Row(
                          //                       mainAxisAlignment: MainAxisAlignment.start,
                          //                       children: [
                          //                         const Icon(Icons.location_on,size: 20,color: grey_400,),
                          //                         Flexible(child: Text("${data.location}",style: greysubtext,))
                          //                       ],
                          //                     ),
                          //                     Row(
                          //                       mainAxisAlignment: MainAxisAlignment.start,
                          //                       children: [
                          //                         const Icon(Icons.access_time,size: 20,color: grey_400,),
                          //                         data.auditStatus == "Pending"?
                          //                         const Text("Due",style: redtext,):Text(capitalize(" ${data.auditStatus}"),style: redtext,),
                          //                         Text(" ${DateFormat("dd-MM-yyyy hh:mm aa").format(DateTime.parse(data.auditStartDate.toString()))}",style: greysubtext,)
                          //                       ],
                          //                     ),
                          //                     Row(
                          //                       mainAxisAlignment: MainAxisAlignment.start,
                          //                       children: [
                          //                         const Icon(Icons.show_chart,size: 20,color: grey_400,),
                          //                         const Text(" Escalation ",style: redtext,),
                          //                         data.escalatedAuditLevels!.isNotEmpty || data.escalatedAuditLevels!=''?
                          //                         Text(" L${data.escalatedAuditLevels} ",style: greysubtext,):const SizedBox()
                          //                       ],
                          //                     ),
                          //                   ],
                          //                 ),
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //       );
                          //     },
                          //   ):
                          //   Center(child: Text(noDataFound,style: dataNotFound,)),
                          // ),
                          FutureBuilder(
                            future:loadcontroller.preventiveScheduleData.isEmpty?loadcontroller.load():null,
                            builder: (context, AsyncSnapshot snapshot) {
                              return RefreshIndicator(
                                key: _refreshIndicatorKey,
                                color: primarycolor,
                                strokeWidth: 3.5,
                                onRefresh: (){
                                  return
                                    Future.delayed(const Duration(milliseconds: 500),(){
                                      if(DataManager.getInstance().getConnection())
                                      {
                                        loadToLocal();
                                      }else{
                                        // load();
                                        loadcontroller.load();
                                      }
                                    });
                                },

                                child: loadcontroller.preventiveScheduleData.isNotEmpty?
                                ListView.builder(
                                  shrinkWrap: false,
                                  physics: const BouncingScrollPhysics(),
                                  controller: scrollController,
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  itemCount: loadcontroller.preventiveScheduleData.isNotEmpty?loadcontroller.preventiveScheduleData.length:0,
                                  itemBuilder: (context,index)
                                  {
                                    if(index<loadcontroller.preventiveScheduleData.length )
                                    {
                                      var data = loadcontroller.preventiveScheduleData[index];
                                      return InkWell(
                                        /*onTap: (){
                                          List<PreventiveScheduleData> temp = [data];
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => Asset_image(assetScheduleData: temp) *//*InspectionFirstStep(auditScheduleId: data.auditSchduleId)*//*,));
                                        },*/
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                                          decoration: const BoxDecoration(
                                            border: Border(bottom: BorderSide(color: grey_400),),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.symmetric(horizontal: 10),
                                                height: 100,
                                                width: 80,
                                                child: Center(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      List<PreventiveScheduleData> temp = [data];
                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Asset_image(assetScheduleData: temp) ,));
                                                      },
                                                    child: CachedNetworkImage(
                                                      placeholder: (context, url) => const Image(image: AssetImage('assets/placeholder.png')),
                                                      imageUrl: data.image=='noimg.png'?
                                                      '${data.assetImage}':'${DataManager.getInstance().getFileUrl()}${data.image}',
                                                      errorWidget: (context, url, error) => const Image(image: AssetImage('assets/placeholder.png')),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Flexible(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      margin:const EdgeInsets.only(left: 0.0),
                                                      child: GestureDetector(
                                                          onTap: () {
                                                            //List<PreventiveScheduleData> temp = [data];
                                                            Navigator.push(context, MaterialPageRoute(builder: (context) => InspectionFirstStep(auditScheduleId: data.auditSchduleId) ,));
                                                          },
                                                          child: Text("${data.auditName?.replaceAll(RegExp('&amp;'), '&')}",style: pricolortext,textAlign: TextAlign.left,overflow: TextOverflow.ellipsis,maxLines: 2,)),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 5.0),
                                                      child: Text("${data.modelName} - ${data.assetTag}",style: greytext,),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 5.0),
                                                      child: Text("Audit schedule id - ${data.auditSchduleId}",style: greytext,),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        const Icon(Icons.location_on,size: 20,color: grey_400,),
                                                        Flexible(child: Text("${data.location}",style: greysubtext,))
                                                      ],
                                                    ),

                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                         Icon(Icons.access_time,size: 18,color: grey_400,),

                                                         if(comparedate(todayTime,data.auditEndDate.toString())== 2)...[
                                                             Text("Overdue",style: redtext,),
                                                             Text(" ${DateFormat("dd-MM-yy hh:mm aa").format(DateTime.parse(data.scheduleExpireDate.toString()))}",style: greysubtext,)
                                                           ]
                                                         else if(comparedate(todayTime,data.auditEndDate.toString())== 1)...
                                                           [
                                                             Text("Due",style: redtext,),
                                                             Text(" ${DateFormat("dd-MM-yy hh:mm aa").format(DateTime.parse(data.auditEndDate.toString()))}",style: greysubtext,)
                                                           ]
                                                        else...[
                                                             Text("Due",style: redtext,),
                                                             Text(" ${DateFormat("dd-MM-yy hh:mm aa").format(DateTime.parse(data.auditEndDate.toString()))}",style: greysubtext,)
                                                           ]

                                                         /*comparedate(todayTime,data.auditEndDate.toString())== 2 ?
                                                           Text("Overdue",style: redtext,) :
                                                           Text("Due",style: redtext,),

                                                          comparedate(todayTime,data.auditEndDate.toString())== 2 ?
                                                          Text(" ${DateFormat("dd-MM-yy hh:mm aa").format(DateTime.parse(data.scheduleExpireDate.toString()))}",style: greysubtext,):
                                                          Text(" ${DateFormat("dd-MM-yy hh:mm aa").format(DateTime.parse(data.auditEndDate.toString()))}",style: greysubtext,)
                                                          */
                                                        /* data.auditStatus == "Pending" ?
                                                        const Text("Due",style: redtext,):Text(capitalize(" ${data.auditStatus}"),style: redtext,),
                                                        Text(" ${DateFormat("dd-MM-yy hh:mm aa").format(DateTime.parse(data.auditEndDate.toString()))}",style: greysubtext,)*/
                                                      ],
                                                    ),
                                                    data.escalatedAuditLevels!.isNotEmpty || data.escalatedAuditLevels!=''?
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        const Icon(Icons.show_chart,size: 20,color: grey_400,),
                                                        const Text(" Escalation ",style: redtext,),

                                                        Text(" L${data.escalatedAuditLevels} ",style: greysubtext,),
                                                      ],
                                                    ):const SizedBox(),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }
                                    else{
                                      return Center( child: CircularProgressIndicator(),);
                                    }
                                  },
                                ):
                                Center(child: Text(noDataFound,style: dataNotFound,)),
                              );
                            },
                          ),
                          // const CompletedScreen(),
                          SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: Column(
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                          margin: const EdgeInsets.only(left: 10),
                                          child: ElevatedButton(
                                              child: const Text("Refresh",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white,fontSize: 12),),
                                              onPressed: () {
                                                if(DataManager.getInstance().getConnection()){
                                                  /*setState(() {
                                                ispullrefresh=true;
                                              });*/
                                                  loadCompletedToLocal();
                                                }
                                              },
                                              style: ElevatedButton.styleFrom(
                                                primary: const Color(0xFFff6634),
                                                padding: EdgeInsets.all(10), // Set padding
                                              )
                                          ),
                                        ),
                                      ),

                                      Align(
                                        alignment: Alignment.topRight,

                                        child: Container(
                                          margin: const EdgeInsets.only(right: 8),
                                          height: 35,
                                          width: 140,
                                          decoration: const BoxDecoration(
                                            border: Border(bottom: BorderSide(color: grey_400),),
                                          ),
                                          child: InkWell(
                                            onTap: () async {
                                              DateTime? pickedDate = await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(1900),
                                                  lastDate: DateTime(2101));
                                              if (pickedDate != null) {
                                                String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
                                                String formattedDate2 = DateFormat('yyyy-MM-dd').format(pickedDate);
                                                setState((){
                                                  dateController1.text = formattedDate2;
                                                  dateController.text = formattedDate;
                                                  noDataFound1='Loading...';
                                                });
                                                loadCompleted(dateController1.text);
                                                Future.delayed(const Duration(seconds: 1),() {
                                                  setState(() {
                                                    noDataFound1='No Data Available!';
                                                  });
                                                },);
                                              } else {
                                                print("Date is not selected");
                                              }
                                            },
                                            child: TextFormField(
                                              controller: dateController,
                                              readOnly: true,
                                              enabled: false,
                                              style: title,
                                              decoration: InputDecoration(
                                                suffixIcon: const Icon(Icons.arrow_drop_down_outlined, size: 24,color: primarycolor,),
                                                suffixIconConstraints: const BoxConstraints(maxWidth:20),
                                                contentPadding: const EdgeInsets.symmetric(vertical: 0,horizontal: 5),
                                                hintText:DateFormat('dd-MM-yyyy').format(DateTime.now()),
                                                hintStyle: title,
                                                enabledBorder: InputBorder.none,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),

                                Flexible(
                                  child:
                                  RefreshIndicator(
                                    color: primarycolor,
                                    strokeWidth: 3.5,
                                    onRefresh: (){
                                      return Future.delayed(const Duration(milliseconds: 500),(){
                                        if(DataManager.getInstance().getConnection()){
                                         /*setState(() {
                                             ispullrefresh=true;
                                           });
                                          loadCompletedToLocal();*/
                                          // Api().getCompletedSchedule(
                                          //   date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
                                          //   userId: DataManager.getInstance().getUserId(),
                                          //   domain: DataManager.getInstance().getCompanyDomain(),
                                          // ).then((value){
                                          //   setState(() {
                                          //     noDataFound = 'Loading...';
                                          //   });
                                          //   loadCompleted(dateController1.text);
                                          // });
                                        }else{
                                          loadCompleted(dateController1.text);
                                        }
                                      });
                                    },
                                    child:completedScheduleData.isNotEmpty?
                                    ListView.builder(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      itemCount: completedScheduleData.isNotEmpty?completedScheduleData.length:0,
                                      // physics: const ScrollPhysics(),
                                      shrinkWrap: false,
                                      itemBuilder: (context,index) {
                                        var data = completedScheduleData[index];
                                        return InkWell(
                                          onTap: (){
                                            if(data.status == 2){
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return Dialog(
                                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                                    elevation: 16,
                                                    child: ListView(
                                                      padding: const EdgeInsets.all(10),
                                                      shrinkWrap: true,
                                                      children: <Widget>[
                                                        Center(child: Text("${data.auditName}",style: pricolortext,)),
                                                        const SizedBox(height: 10),
                                                        const Center(child: Text('Error')),
                                                        const SizedBox(height: 10),
                                                        Text(data.response.toString()),

                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            }
                                            else {
                                              Navigator.push(context, MaterialPageRoute(
                                                builder: (context) =>
                                                    Inspection_details(scheduleData: data),));
                                            }
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                                            decoration: const BoxDecoration(
                                              border: Border(bottom: BorderSide(color: grey_400),),
                                            ),
                                            child: Column(
                                              children: [
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      margin: const EdgeInsets.symmetric(horizontal: 10),
                                                      height: 90,
                                                      width: MediaQuery.of(context).size.width*0.22,
                                                      child: Center(
                                                        child: CachedNetworkImage(
                                                          placeholder: (context, url) => const Image(image: AssetImage('assets/placeholder.png')),
                                                          imageUrl: data.image=='noimg.png'?
                                                          '${data.assetImage}':'${DataManager.getInstance().getFileUrl()}${data.image}',
                                                          errorWidget: (context, url, error) => const Image(image: AssetImage('assets/placeholder.png')),
                                                        ),
                                                      ),
                                                    ),
                                                    Flexible(
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 4.0),
                                                            child: Text("${data.auditName}",style: pricolortext,overflow: TextOverflow.ellipsis,maxLines: 2,),
                                                          ),
                                                          const SizedBox(height: 5,),
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 5.0),
                                                            child: Text("${data.modelName} - ${data.assetTag}",style: greytext,),
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 5.0),
                                                            child: Text("Audit schedule id - ${data.auditSchduleId}",style: greytext,),
                                                          ),
                                                          Row(children:[
                                                            const Icon(Icons.location_on,size: 17,color: grey_400,),
                                                            data.location != null?Text(" Location : ${data.location}",style: greysubtext,):
                                                            const Text(" Location : ",style: greysubtext,),
                                                          ],),
                                                          Row(children: [
                                                            const Icon(Icons.access_time_filled,size: 17,color: grey_400,),
                                                            const Text("Inspection Date :",style: redtext,),
                                                            data.auditInspectionDate != null?
                                                            Flexible(child: Text(DateFormat('dd-MM-yyyy hh:mm aa').format(DateTime.parse(data.auditInspectionDate.toString())),style: greysubtext,overflow: TextOverflow.ellipsis,maxLines: 2,)):
                                                            const Text(""),
                                                          ],),
                                                          Row(children: [
                                                            const Icon(Icons.person,size: 20,color: grey_400,),
                                                            const Text("Inspected by :",style: redtext,),
                                                            Flexible(child: Text(data.inspectionBy.toString(),style: greysubtext,overflow: TextOverflow.ellipsis,maxLines: 2)),
                                                            const Spacer(),
                                                            data.status == 0?
                                                            const Icon(Icons.done_all,size: 20,color: grey_400,):
                                                            data.status == 1?
                                                            const Icon(Icons.done_all,size: 20,color: primarycolor,):
                                                            const Icon(Icons.info_outline,size: 20,color: Colors.red,),
                                                          ],),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ):
                                    Center(child: Text(noDataFound1,style: dataNotFound,)),
                                  ),

                                  // FutureBuilder(
                                  //   future:completedScheduleData.isEmpty?loadCompleted(dateController1.text):null,
                                  //   builder: (context, AsyncSnapshot snapshot) {
                                  //     return RefreshIndicator(
                                  //       color: primarycolor,
                                  //       strokeWidth: 3.5,
                                  //       onRefresh: (){
                                  //         return Future.delayed(const Duration(seconds: 3),(){
                                  //           if(DataManager.getInstance().getConnection()){
                                  //             loadCompletedToLocal();
                                  //             // Api().getCompletedSchedule(
                                  //             //   date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
                                  //             //   userId: DataManager.getInstance().getUserId(),
                                  //             //   domain: DataManager.getInstance().getCompanyDomain(),
                                  //             // ).then((value){
                                  //             //   setState(() {
                                  //             //     noDataFound = 'Loading...';
                                  //             //   });
                                  //             //   loadCompleted(dateController1.text);
                                  //             // });
                                  //           }else{
                                  //             loadCompleted(dateController1.text);
                                  //           }
                                  //         });
                                  //       },
                                  //       child:completedScheduleData.isNotEmpty?
                                  //       ListView.builder(
                                  //         padding: const EdgeInsets.symmetric(horizontal: 10),
                                  //         itemCount: completedScheduleData.isNotEmpty?completedScheduleData.length:0,
                                  //         // physics: const ScrollPhysics(),
                                  //         shrinkWrap: false,
                                  //         itemBuilder: (context,index) {
                                  //           var data = completedScheduleData[index];
                                  //           return InkWell(
                                  //             onTap: (){
                                  //               if(data.status == 2){
                                  //                 showDialog(
                                  //                   context: context,
                                  //                   builder: (context) {
                                  //                     return Dialog(
                                  //                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                  //                       elevation: 16,
                                  //                       child: ListView(
                                  //                         padding: const EdgeInsets.all(10),
                                  //                         shrinkWrap: true,
                                  //                         children: <Widget>[
                                  //                           Center(child: Text("${data.auditName}",style: pricolortext,)),
                                  //                           const SizedBox(height: 10),
                                  //                           const Center(child: Text('Error')),
                                  //                           const SizedBox(height: 10),
                                  //                           Text(data.response.toString()),
                                  //
                                  //                         ],
                                  //                       ),
                                  //                     );
                                  //                   },
                                  //                 );
                                  //               }
                                  //               else {
                                  //                 Navigator.push(context, MaterialPageRoute(
                                  //                   builder: (context) =>
                                  //                       Inspection_details(scheduleData: data),));
                                  //               }
                                  //             },
                                  //             child: Container(
                                  //               padding: const EdgeInsets.symmetric(vertical: 5.0),
                                  //               decoration: const BoxDecoration(
                                  //                 border: Border(bottom: BorderSide(color: grey_400),),
                                  //               ),
                                  //               child: Column(
                                  //                 children: [
                                  //                   Row(
                                  //                     crossAxisAlignment: CrossAxisAlignment.center,
                                  //                     children: [
                                  //                       Container(
                                  //                         margin: const EdgeInsets.symmetric(horizontal: 10),
                                  //                         height: 90,
                                  //                         width: MediaQuery.of(context).size.width*0.22,
                                  //                         child: Center(
                                  //                           child: CachedNetworkImage(
                                  //                             placeholder: (context, url) => const Image(image: AssetImage('assets/placeholder.png')),
                                  //                             imageUrl: '${DataManager.getInstance().getFileUrl()}${data.image}',
                                  //                             errorWidget: (context, url, error) => const Image(image: AssetImage('assets/placeholder.png')),
                                  //                           ),
                                  //                         ),
                                  //                       ),
                                  //                       Flexible(
                                  //                         child: Column(
                                  //                           crossAxisAlignment: CrossAxisAlignment.start,
                                  //                           children: [
                                  //                             Padding(
                                  //                               padding: const EdgeInsets.only(left: 4.0),
                                  //                               child: Text("${data.auditName}",style: pricolortext,overflow: TextOverflow.ellipsis,maxLines: 2,),
                                  //                             ),
                                  //                             const SizedBox(height: 5,),
                                  //                             Padding(
                                  //                               padding: const EdgeInsets.only(left: 5.0),
                                  //                               child: Text("${data.modelName} - ${data.assetTag}",style: greytext,),
                                  //                             ),
                                  //                             Row(children:[
                                  //                               const Icon(Icons.location_on,size: 17,color: grey_400,),
                                  //                               data.location != null?Text(" Location : ${data.location}",style: greysubtext,):
                                  //                               const Text(" Location : ",style: greysubtext,),
                                  //                             ],),
                                  //                             Row(children: [
                                  //                               const Icon(Icons.access_time_filled,size: 17,color: grey_400,),
                                  //                               const Text("Inspection Date :",style: redtext,),
                                  //                               data.auditInspectionDate != null?
                                  //                               Flexible(child: Text(DateFormat('dd-MM-yyyy hh:mm aa').format(DateTime.parse(data.auditInspectionDate.toString())),style: greysubtext,overflow: TextOverflow.ellipsis,maxLines: 2,)):
                                  //                               const Text(""),
                                  //                             ],),
                                  //                             Row(children: [
                                  //                               const Icon(Icons.person,size: 20,color: grey_400,),
                                  //                               const Text("Inspected by :",style: redtext,),
                                  //                               Text(data.inspectionBy.toString(),style: greysubtext,overflow: TextOverflow.ellipsis,),
                                  //                               const Spacer(),
                                  //                               data.status == 0?
                                  //                               const Icon(Icons.done_all,size: 20,color: grey_400,):
                                  //                               data.status == 1?
                                  //                               const Icon(Icons.done_all,size: 20,color: primarycolor,):
                                  //                               const Icon(Icons.info_outline,size: 20,color: Colors.red,),
                                  //                             ],),
                                  //                           ],
                                  //                         ),
                                  //                       ),
                                  //                     ],),
                                  //                 ],
                                  //               ),
                                  //             ),
                                  //           );
                                  //         },
                                  //       ):
                                  //       Center(child: Text(noDataFound1,style: dataNotFound,)),
                                  //     );
                                  //   },
                                  // ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
        ),
      ),
    );
  }

  callfun()
  {
    Get.find<LoadController>().load();//show record at first
    int cnt = ((total_count/100).round());

    print("cnt=>"+cnt.toString());

    for(int i=0; i <=cnt; i++)
    {
      if(offset > total_count)
      {
        //not to call api
      }
      else{
        offset = limit+offset;
        limit=100;
        loadToLocal_2(limit,offset);
        /*Future.delayed(Duration(seconds: 1), () {
          loadToLocal_2(limit,offset);
        });*/
      }
    }


    if(offset > total_count){
      //print("offset in main"+offset.toString());
      Get.find<LoadController>().load();//after insert all show record
    }



  }


  int comparedate(String current_date, String audit_enddate)
  {
    //data.auditName?.replaceAll(RegExp('&amp;'), '&')
    audit_enddate = audit_enddate.replaceAll(RegExp('T'), ' ');
    audit_enddate = audit_enddate.replaceAll(RegExp('Z'), '');
    //print("cdate R->"+current_date);
    //print("edate R->"+audit_enddate);

    int val = -1;
    //DateTime cureent_date_dt1 = DateTime.parse(current_date);
    //DateTime end_date_dt2 = new DateFormat("yyyy-MM-dd").parse(audit_enddate);

    DateTime cureent_date_dt1 = new DateFormat("yyyy-MM-dd hh:mm").parse(current_date);
    DateTime end_date_dt2 = new DateFormat("yyyy-MM-dd hh:mm").parse(audit_enddate);

    String date1 = DateFormat("yyyy-MM-dd hh:mm").format(cureent_date_dt1);
    String date2 = DateFormat("yyyy-MM-dd hh:mm").format(end_date_dt2);

    //print("cdate-P>"+date1);
    print("edate-P>"+date2);
    //DateTime dt2 = DateTime.parse(audit_enddate);

    if(cureent_date_dt1.isBefore(end_date_dt2))
    {
       val=1;
    }
    else if(cureent_date_dt1.isAfter(end_date_dt2))
    {
        val=2;
    }
    else if(cureent_date_dt1.isAtSameMomentAs(end_date_dt2))
    {
      val=0;
    }

    /*if (cureent_date_dt1.compareTo(end_date_dt2) == 0) {
      print("Both date time are at same moment.");
      val=0;
    }

    if (cureent_date_dt1.compareTo(end_date_dt2) < 0) {
      print("DT1 is before DT2");
      val=1;
    }

    if (cureent_date_dt1.compareTo(end_date_dt2) > 0) {
      print("DT1 is after DT2");
      val=2;
    }
*/
    return val;
  }



}

