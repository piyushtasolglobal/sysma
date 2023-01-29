
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
import 'Asset_Status/assets_status.dart';
import 'CategoryList_screen.dart';
import 'Components_screen.dart';
import 'Licenses_Screen.dart';
import 'Qrcode.dart';
import 'Setting_screen.dart';
import 'package:get/get.dart';

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

  late num total_count;
  String str_total_cnt="";
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
  List<CompletedScheduleData> resComplete = [];

  // Fetching the first 20 posts
  int _offsetdb = 20;

  late SharedPreferences prefs;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(_scrollListner);
    initalizePref();

    _tapController?.index = widget.index!;
    dateController1.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
    noDataFound = 'Loading...';
    noDataFound1 = 'Loading...';

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
  }

  loadToLocal(){
    //print(DataManager.getInstance().getCompanyDomain().toString());
    Api().getPreventiveSchedule_2(
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
        print("loaded")
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
            Get.find<LoadController>().preventiveScheduleData.isEmpty?
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: InkWell(
                onTap:null,
                child:  Icon(Icons.qr_code_scanner,size: 24,color: Colors.grey,),
              ),
            ):
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: InkWell(
                onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context) => const QRcodescan(),));},
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
                                Icon(Icons.person,),
                                SizedBox(width: 5,),
                                Text("Breakdown"),
                              ],
                            ),
                          ),
                          Tab(
                            icon: Row(
                              children: const [
                                Icon(Icons.person,),
                                SizedBox(width: 5,),
                                Text("Preventive",),
                              ],
                            ),
                          ),
                          Tab(
                            icon: Row(
                              children: const [
                                Icon(Icons.person,),
                                SizedBox(width: 5,),
                                Text("Completed",),
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
                                        onTap: (){
                                          List<PreventiveScheduleData> temp = [data];
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => Asset_image(assetScheduleData: temp),));
                                        },
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
                                                    Container(
                                                      margin:const EdgeInsets.only(left: 0.0),
                                                      child: Text("${data.auditName}",style: pricolortext,textAlign: TextAlign.left,overflow: TextOverflow.ellipsis,maxLines: 2,),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 5.0),
                                                      child: Text("${data.modelName} - ${data.assetTag}",style: greytext,),
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
                                                        const Icon(Icons.access_time,size: 20,color: grey_400,),
                                                        data.auditStatus == "Pending"?
                                                        const Text("Due",style: redtext,):Text(capitalize(" ${data.auditStatus}"),style: redtext,),
                                                        Text(" ${DateFormat("dd-MM-yyyy hh:mm aa").format(DateTime.parse(data.auditStartDate.toString()))}",style: greysubtext,)
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
                                Flexible(
                                  child:
                                  RefreshIndicator(
                                    color: primarycolor,
                                    strokeWidth: 3.5,
                                    onRefresh: (){
                                      return Future.delayed(const Duration(milliseconds: 500),(){
                                        if(DataManager.getInstance().getConnection()){
                                          loadCompletedToLocal();
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
                                                            Text(data.inspectionBy.toString(),style: greysubtext,overflow: TextOverflow.ellipsis,),
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


}

