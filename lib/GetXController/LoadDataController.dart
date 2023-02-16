import 'dart:convert';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';

import '../Dashboard/db/sqlite_service.dart';
import '../models/Preventive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/Workorder3.dart';

class LoadController extends GetxController{
  List<PreventiveScheduleData> preventiveScheduleData=[];
  List<Workorder3> workorder3=[];
  String today = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String todayTime = DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now());


  Future<List<PreventiveScheduleData>> load() async
  {
     preventiveScheduleData.clear();
    loadPreventiveLocal().then((value){
      preventiveScheduleData = value;
      update();
    });
    return preventiveScheduleData;
  }

  Future<List<PreventiveScheduleData>> load_notification() async
  {
    // preventiveScheduleData.clear();
    loadnotification_1().then((value){
      preventiveScheduleData = value;
      update();
    });

    //call if pmids is avaialble
    loadnotification_2();
    return preventiveScheduleData;
  }

    load_2(int limit) async
    {
      // preventiveScheduleData.clear();
       loadPreventiveLocal_2(limit);
      //update();
    }


  /*List<PreventiveScheduleData> load_2()
  {
    // preventiveScheduleData.clear();
    List<PreventiveScheduleData> preventiveScheduleData1=[];
    preventiveScheduleData1 = loadPreventiveLocal_2(10);

    for (var i in preventiveScheduleData1)
    {
      try {
        preventiveScheduleData.add(
            PreventiveScheduleData(
              // id : num.parse(i['sId'].toString()),
              auditSchduleId: num.parse(i.auditSchduleId.toString()),
              // companyId: num.parse(i['companyId'].toString()),
              assetTagId: num.parse(i.assetTagId.toString()),
              // userId: num.parse(i['userId'].toString()),
              auditName: i.auditName.toString(),
              auditStatus: i.auditStatus.toString(),
              image: i.image.toString(),
              assetImage: i.assetImage.toString(),
              modelName: i.modelName.toString(),
              assetTag: i.assetTag.toString(),
              location: i.location.toString(),
              auditEndDate: i.auditEndDate.toString(),
              auditStartDate: i.auditStartDate.toString(),
              // lastAuditDate: i['lastAuditDate'].toString(),
              scheduleExpireDate: i.scheduleExpireDate.toString(),
              escalatedAuditLevels: i.escalatedAuditLevels.toString(),
              maintenanceType: i.maintenanceType.toString(),
              companyName: i.companyName.toString(),
              categoryName: i.categoryName.toString(),
              purchaseDate: i.purchaseDate.toString() ?? ' ',
              supplierName: i.supplierName.toString(),
              warrantyMonths: num.parse(i.warrantyMonths.toString()),
              canCheckout: i.canCheckout!= null ? num.parse(
                  i.canCheckout.toString()) : 0,
              canCheckin: i.canCheckin != null ? num.parse(
                  i.canCheckin.toString()) : 0,
              // auditParamsId:num.parse(i['auditParamsId'].toString()),
              auditParamsValues: jsonDecode(i.auditParamsValues.toString()),
              statusLabel: i.statusLabel.toString(),
              dueDate: i.dueDate.toString(),
            ));
      }catch(e){
        print(e);
      }

    }
    update();
    return preventiveScheduleData;

    //return preventiveScheduleData;
  }*/

  Future<List<Workorder3>> load_test() async
  {
    //workorder3.clear();
    test().then((value){
      workorder3 = value;
      update();
    });
    return workorder3;
  }

  Future<List<Workorder3>> test() async{
    List<Workorder3> workorder1=[];
    await dbHelper().getDb()!.then((value)
    {
      value.rawQuery("SELECT * From 'Workorders' ").then((value) {
        for (var i in value){
          try {
            workorder1.add(Workorder3(
              // id : num.parse(i['sId'].toString()),
              ticketId: i['auditSchduleId'].toString(),
              title: i['title'].toString(),
              due_date: i['due_date'].toString(),
              description: i['description'].toString(),
              priority_id: i['priority_id'].toString(),
              priority: i['priority'].toString(),
              category_id: i['category_id'].toString(),
              category: i['category'].toString(),
              assignee_id: i['assignee_id'].toString(),
              assignee_name: i['assignee_name'].toString(),
              status_id: i['status_id'].toString(),
              status_text: i['status_text'].toString(),
              asset_id: i['asset_id'].toString(),
              asset_name: i['asset_name'].toString(),
              asset_working_status: i['asset_working_status'].toString(),
              location: i['location'].toString(),
              created_at: i['created_at'].toString(),
              updated_at: i['updated_at'].toString(),

            ) );
          }catch(e){
            print(e);
          }
        }
      });
    });
    return workorder1;
  }



  Future<List<PreventiveScheduleData>> loadPreventiveLocal() async{
    List<PreventiveScheduleData> preventiveScheduleData1=[];
    await dbHelper().getDb()!.then((value)
    {
      value.rawQuery("SELECT * From 'Schedule' WHERE maintenanceType == 'preventive' AND auditStatus != 'completed' OR scheduleExpireDate >= '$todayTime' Limit 20").then((value) {
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

  loadPreventiveLocal_2(int offset) async
  {
    List<PreventiveScheduleData> preventiveScheduleData1=[];
    await dbHelper().getDb()!.then((value) {
      value.rawQuery("SELECT * From 'Schedule' WHERE maintenanceType == 'preventive' AND auditStatus != 'completed' OR scheduleExpireDate >= '$todayTime' Limit 100 OFFSET $offset").then((value) {
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

        for(int i=0; i<value.length;i++)
        {
          PreventiveScheduleData copyObject = PreventiveScheduleData.fromJson(preventiveScheduleData1[i].toJson());
          preventiveScheduleData.add(copyObject);
        }
        update();
        //preventiveScheduleData = preventiveScheduleData1;

      });
    });

  }


  loadPreventiveLocal_3(int offset, int rem) async
  {
    List<PreventiveScheduleData> preventiveScheduleData1=[];
     dbHelper().getDb()!.then((value) {
      value.rawQuery("SELECT * From 'Schedule' WHERE maintenanceType == 'preventive' AND auditStatus != 'completed' OR scheduleExpireDate >= '$todayTime' Limit $rem OFFSET $offset").then((value) {
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

        for(int i=0; i<value.length;i++)
        {
          PreventiveScheduleData copyObject = PreventiveScheduleData.fromJson(preventiveScheduleData1[i].toJson());
          preventiveScheduleData.add(copyObject);
        }
        update();
        //preventiveScheduleData = preventiveScheduleData1;

      });
    });


  }


  Future<List<PreventiveScheduleData>> loadnotification_1() async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? assetids="";
    String? qry="";
    String? pmids="";
    bool is_assetids=false;
    bool is_pmids=false;

    await prefs.setBool("is_paramget", false);

    if(prefs.getString("assetids") != null)
    {
      assetids = prefs.getString("assetids");
      is_assetids=true;
      qry="SELECT * From 'Schedule' WHERE assetTagId IN ($assetids)";
    }

    List<PreventiveScheduleData> preventiveScheduleData1=[];
    await dbHelper().getDb()!.then((value)
    {
      value.rawQuery(qry!).then((value) {
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


  loadnotification_2() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? qry="";
    String? pmids="";
    bool is_pmids=false;

    await prefs.setBool("is_paramget", false);

    if(prefs.getString("pmids") != null)
    {
      pmids = prefs.getString("pmids");
      is_pmids=true;
      qry="SELECT * From 'PMHistory' WHERE assetTagId IN ($pmids)";
    }

    List<PreventiveScheduleData> preventiveScheduleData1=[];
    await dbHelper().getDb()!.then((value) {
      value.rawQuery(qry!).then((value) {
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
        for(int i=0; i<value.length;i++)
        {
          PreventiveScheduleData copyObject = PreventiveScheduleData.fromJson(preventiveScheduleData1[i].toJson());
          preventiveScheduleData.add(copyObject);
        }
        update();
        //preventiveScheduleData = preventiveScheduleData1;

      });
    });


  }



}