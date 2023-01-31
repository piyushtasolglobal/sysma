import 'dart:convert';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';

import '../Dashboard/db/sqlite_service.dart';
import '../models/Preventive.dart';

class LoadController extends GetxController{
  List<PreventiveScheduleData> preventiveScheduleData=[];
  String today = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String todayTime = DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now());


  Future<List<PreventiveScheduleData>> load() async
  {
    // preventiveScheduleData.clear();
    loadPreventiveLocal().then((value){
      preventiveScheduleData = value;
      update();
    });
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


  Future<List<PreventiveScheduleData>> loadPreventiveLocal() async{
    List<PreventiveScheduleData> preventiveScheduleData1=[];
     dbHelper().getDb()!.then((value)
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
     dbHelper().getDb()!.then((value) {
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


}