
import 'dart:convert';
import 'package:adani/Dashboard/db/sqlite_service.dart';
import 'package:adani/controllar/data_manager.dart';
import 'package:adani/controllar/share_prefrence.dart';
import 'package:adani/models/Accessories.dart' as As;
import 'package:adani/models/AssetsStatus.dart';
import 'package:adani/models/Breakdown.dart';
import 'package:adani/models/CategoryModels.dart';
import 'package:adani/models/Companies.dart';
import 'package:adani/models/Completed.dart';
import 'package:adani/models/Components.dart';
import 'package:adani/models/ComponentsLogs.dart';
import 'package:adani/models/ComponentsUser.dart';
import 'package:adani/models/Consumables.dart' as con;
import 'package:adani/models/Kits.dart';
import 'package:adani/models/Licenses.dart';
import 'package:adani/models/LocationModel.dart';
import 'package:adani/models/Preventive.dart';
import 'package:adani/models/SelectAssetModel.dart';
import 'package:adani/models/SelectStatusModel.dart';
import 'package:adani/models/SelectUserModel.dart';
import 'package:adani/models/demo.dart';
import 'package:http/http.dart';
import '../models/AccessoriesLogs.dart';
import '../models/AccessoryUser.dart';
import '../models/ConsumableLogsModel.dart';
import '../models/ConsumableUserModel.dart';
import 'url.dart';


// await dbHelper().getDb()!.then((value) {
// value.transaction((txn) async {
// var batch = txn.batch();
//
// await batch.commit();
// });
// });
class Api{
  Future login({phone}) async{
    final response = await post(Uri.parse("$baseUrl/uat/login"),
    headers:loginHeader,
    body: {"mobile":phone.toString()});
    var data = jsonDecode(response.body);
    return data;
  }

  Future<Companies>getCompanyList() async {
    final response = await post(Uri.parse("https://staging.sysmatech.com/public/db_check.php"),
      // headers:header,
      body: {"phone":DataManager.getInstance().getPhone().toString()}
    );
    var data = jsonDecode(response.body);
    return Companies.fromJson(data);
  }

  Future saveInspectionInfo(Demo data) async{
    await dbHelper().getDb()!.then((value){
      value.insert('InspectionData', data.toJson());
    });
    return "Inspection Data Submitted";
  }

  Future<Breakdown>getBreakdownSchedule() async {
    final response = await post(Uri.parse("${DataManager.getInstance().getCompanyDomain()}get_my_asset_type_schedule"),
      headers:{
        "Authorization":"Bearer ${DataManager.getInstance().getCompanyToken()}",
        "Accept":"application/json"
      },
      body: {
        "user_id":DataManager.getInstance().getUserId(),
        "maintenance_type":"breakdown"
      }
    );
    var data = jsonDecode(response.body);
    return Breakdown.fromJson(data);
  }

  Future<Preventive>getPreventiveSchedule({userId,domain,cid,token,limit}) async {
    dbHelper().getDb()!.then((value) {
      value.rawDelete("DELETE FROM Schedule");
      value.rawDelete("DELETE FROM PMHistory");
    });

    var data;
    print("===========api call ================");
    var ctime = DateTime.now();
    final response = await post(
        Uri.parse("${domain}get_my_asset_type_schedule?user_id=$userId"),
        headers: {"Authorization":"Bearer $token","Accept":"application/json"},
         body: {
           "limit": limit
           //"maintenance_type": "preventive"
         },
      );
    var lctime = DateTime.now();
    try {
      data = jsonDecode(response.body);
      print("time difference -${ctime}, ${lctime}");
      print(lctime.second-ctime.second);

      //print(response.body);


      // print("=== preventive scedule data ===");
      // print(data);
      // List<PreventiveScheduleData> res = [];
      // if (data['api_status'] == 1) {
      //   res = data['totalAssetScheduledata'].map<PreventiveScheduleData>((json) => PreventiveScheduleData.fromJson(json)).toList();
      //   if(res.isNotEmpty) {
      //     SharePre.setScheduleTableStatus(0);
      //     SharedPreferences prefs = await SharedPreferences.getInstance();
      //     print("=== local preventive table status ====");
      //     print(prefs.getInt('scheduleTableStatus'));
      //     if(prefs.getInt('scheduleTableStatus') == 0 || prefs.getInt('scheduleTableStatus') == 1) {
      //       for (int i = 0; i < res.length; i++) {
      //         var insertData = {
      //           'sId': res[i].id,
      //           'auditSchduleId': res[i].auditSchduleId,
      //           'companyId': res[i].companyId,
      //           'assetTagId': res[i].assetTagId,
      //           'userId': res[i].userId ?? 0,
      //           'auditName': res[i].auditName,
      //           'auditStatus': res[i].auditStatus,
      //           'image': res[i].image,
      //           'modelName': res[i].modelName,
      //           'assetTag': res[i].assetTag,
      //           'location': res[i].location ?? ' ',
      //           'auditStartDate': res[i].auditStartDate != null ? res[i]
      //               .auditStartDate.toString() : "0000-00-00 00:00",
      //           'auditEndDate': res[i].auditEndDate != null ? res[i]
      //               .auditEndDate.toString() : "0000-00-00 00:00",
      //           'lastAuditDate': res[i].lastAuditDate,
      //           'scheduleExpireDate': res[i].scheduleExpireDate != null
      //               ? DateFormat("yyyy-MM-dd")
      //               .format(
      //               DateTime.parse(res[i].scheduleExpireDate.toString()))
      //               .toString()
      //               : "0000-00-00",
      //           'escalatedAuditLevels': res[i].escalatedAuditLevels ?? 0,
      //           'maintenanceType': res[i].maintenanceType,
      //           'companyName': res[i].companyName ?? ' ',
      //           'categoryName': res[i].categoryName ?? ' ',
      //           'purchaseDate': res[i].purchaseDate ?? ' ',
      //           'supplierName': res[i].supplierName ?? ' ',
      //           'warrantyMonths': res[i].warrantyMonths ?? 0,
      //           'canCheckout': res[i].canCheckout,
      //           'canCheckin': res[i].canCheckin,
      //           'auditParamsId': res[i].auditParamsId,
      //           'auditParamsValues': jsonEncode(res[i].auditParamsValues),
      //           'statusLabel': res[i].statusLabel ?? '',
      //           'dueDate': res[i].dueDate ?? ''
      //         };
      //         await dbHelper().getDb()!.then((value) {
      //           value.insert('Schedule', insertData);
      //           // value.rawQuery("SELECT * From Schedule WHERE companyId=$cid")
      //           //     .then((v) {
      //           // if (v.isNotEmpty) {
      //           //   for (var j in v) {
      //           //     if (res[i].id != j['sId']) {
      //           //       value.insert('Schedule', insertData);
      //           //     }
      //           //     else {
      //           //       value.update(
      //           //           'Schedule', insertData, where: '${j['sId']} =?',
      //           //           whereArgs: [res[i].id.toString()]);
      //           //     }
      //           //   }
      //           // } else {
      //           //   value.insert('Schedule', insertData);
      //           // }
      //           // });
      //         });
      //         for (int h = 0; h < res[i].pmHistory!.length; h++) {
      //           var insertPmHistory = {
      //             'auditSchduleId': res[i].pmHistory![h].auditSchduleId,
      //             'assetTagId': res[i].pmHistory![h].assetTagId,
      //             'auditResult': res[i].pmHistory![h].auditResult,
      //             'auditInspectionDate': res[i].pmHistory![h]
      //                 .auditInspectionDate,
      //             'auditName': res[i].pmHistory![h].auditName
      //           };
      //           await dbHelper().getDb()!.then((value) {
      //             value.insert('PMHistory', insertPmHistory);
      //             // value.rawQuery("SELECT * From PMHistory WHERE assetTagId=${res[i]
      //             //     .assetTagId}").then((v) {
      //             //   if (v.isNotEmpty) {
      //             //     for (var k in v) {
      //             //       if (res[i].pmHistory![h].auditSchduleId != k['id']) {
      //             //         value.insert('PMHistory', insertPmHistory);
      //             //       } else {
      //             //         value.update(
      //             //             'PMHistory', insertPmHistory, where: k['id'] = res[i]
      //             //             .pmHistory![h].auditSchduleId.toString());
      //             //       }
      //             //     }
      //             //   } else {
      //             //     value.insert('PMHistory', insertPmHistory);
      //             //   }
      //             // });
      //           });
      //         }
      //       }
      //     }
      //   }else{
      //     SharePre.setScheduleTableStatus(1);
      //   }
      // }else {
      //   SharePre.setScheduleTableStatus(1);
      // }
    }catch(e){
      print("Error comming");
      throw Exception('Error on server');
    }

     /*if(limit > 1982)
      {
         print(data);
      }*/

    return Preventive.fromJson(data);
  }

  Future<Completed>getCompletedSchedule({userId,domain,date}) async {
    print("========= completed api data stored ============");
    dbHelper().getDb()!.then((value) {
      value.rawDelete("DELETE FROM CompletedSchedule WHERE status =?",[1]);
    });
    final response = await post(Uri.parse("${domain}get_my_past_asset_schedule"),
      headers:{
        "Authorization":"Bearer ${DataManager.getInstance().getCompanyToken()}",
        "Accept":"application/json"
      },
      body: {
        "user_id":userId.toString()
        // "date":date.toString()
      },
    );
    var data;
    try {
      data = jsonDecode(response.body);
      print("=== completed api response data ===");
      // print(data['api_status']);
      List<CompletedScheduleData> res = [];
      if (data['api_status'] == 1) {
        res = data['totalAssetScheduledata'].map<CompletedScheduleData>((json) => CompletedScheduleData.fromJson(json)).toList();
        if (res.isNotEmpty) {
          SharePre.setCompleteTableStatus(0);
          // await dbHelper().getDb()!.then((value) {
          //   value.transaction((txn) async {
          //     var batch = txn.batch();
          //     for (int i = 0; i < res.length; i++) {
          //       var insertData = {
          //         'auditSchduleId': res[i].auditSchduleId,
          //         'assetTagId': res[i].assetTagId,
          //         'auditName': res[i].auditName,
          //         'auditStatus': res[i].auditStatus,
          //         'image': res[i].image,
          //         'modelName': res[i].modelName,
          //         'assetTag': res[i].assetTag,
          //         'location': res[i].location ?? ' ',
          //         'auditEndDate': res[i].auditEndDate,
          //         'auditInspectionDate': res[i].auditInspectionDate,
          //         'auditInspectionDateF':DateFormat("yyyy-MM-dd").format(DateTime.parse(res[i].auditInspectionDate.toString())),
          //         'scheduleExpireDate': res[i].scheduleExpireDate != null
          //             ? DateFormat("yyyy-MM-dd")
          //             .format(
          //             DateTime.parse(res[i].scheduleExpireDate.toString()))
          //             .toString()
          //             : "0000-00-00",
          //         'escalatedAuditLevels': res[i].escalatedAuditLevels ?? 0,
          //         'maintenanceType': res[i].maintenanceType,
          //         'companyName': res[i].companyName ?? ' ',
          //         'categoryName': res[i].categoryName ?? ' ',
          //         'purchaseDate': res[i].purchaseDate ?? ' ',
          //         'lastAuditDate': res[i].lastAuditDate ?? ' ',
          //         'supplierName': res[i].supplierName ?? ' ',
          //         'warrantyMonths': res[i].warrantyMonths ?? 0,
          //         'canCheckout': 0,
          //         'canCheckin': 0,
          //         'auditParamsValues': jsonEncode(res[i].auditParamsValues),
          //         'auditParamsTransaction': jsonEncode(res[i].auditParamsTransaction),
          //         'inspectionBy': res[i].inspectionBy,
          //         'status':1,
          //         'response':'',
          //         'userId':DataManager.getInstance().getUserId()
          //       };
          //       batch.insert('CompletedSchedule', insertData);
          //     }
          //     await batch.commit();
          //   });
          // });
        }
        else {
          SharePre.setCompleteTableStatus(1);
        }
      }else {
        SharePre.setCompleteTableStatus(1);
      }
    }catch(e){
      print(e);
    }
    return Completed.fromJson(data);
  }

  // accesories
  Future<As.Accessories>getAccessoriesList() async {
    /// Clear local Accessories table
    dbHelper().getDb()!.then((value) {value.rawDelete("DELETE FROM Accessories");});

    /// Api call
    final response = await get(Uri.parse("${DataManager.getInstance().getCompanyDomain()}accessories?user_id=${DataManager.getInstance().getUserId()}"),
      headers:{
        "Authorization":"Bearer ${DataManager.getInstance().getCompanyToken()}",
        "Accept":"application/json"
      },
    );
    /// Decode api response and store in table
    var data = jsonDecode(response.body);
    List<As.AccessoriesData> res = [];
    res = data['rows'].map<As.AccessoriesData>((json) => As.AccessoriesData.fromJson(json)).toList();
    await dbHelper().getDb()!.then((value) {
      value.transaction((txn) async {
        var batch = txn.batch();
        for(int i=0;i<res.length;i++){
          var insertData = {
            'aId':res[i].id,
            'image':res[i].image??'',
            'name':res[i].name??'',
            'manufacturer':jsonEncode(res[i].manufacturer),
            'category':jsonEncode(res[i].category)??" ",
            'location':res[i].location != null ? jsonEncode(res[i].location):jsonEncode(As.Location(id:0,name:' ')),
            'avlQty':res[i].remainingQty??0,
            'minQty':res[i].minQty??0
          };
          batch.insert('Accessories', insertData);
        }
        await batch.commit();
      });
    });

    return As.Accessories.fromJson(data);
  }
  Future<AccessoryUser>getAccessoriesDetailsList({accessoryId}) async {
    /// Api call
    final response = await get(Uri.parse("${DataManager.getInstance().getCompanyDomain()}accessories/$accessoryId/users?offset=0"),
      headers:{
        "Authorization":"Bearer ${DataManager.getInstance().getCompanyToken()}",
        "Accept":"application/json"
      },
    );
    /// Decode api response and return
    var data = jsonDecode(response.body);
    return AccessoryUser.fromJson(data);
  }
  Future<AccessoriesLogs>getAccessoriesDetailsLogs({accessoryId}) async {
    /// Api call
    final response = await get(Uri.parse("${DataManager.getInstance().getCompanyDomain()}accessories/$accessoryId/checkinoutaccessorylog?offset=0&limit-1"),
      headers:{
        "Authorization":"Bearer ${DataManager.getInstance().getCompanyToken()}",
        "Accept":"application/json"
      },
    );
    /// Decode api response and return
    var data = jsonDecode(response.body);
    return AccessoriesLogs.fromJson(data);
  }

  // Consumables
  Future<con.Consumables>getConsumablesList() async {
    /// Clear local table
    dbHelper().getDb()!.then((value) {value.rawDelete("DELETE FROM Consumable");});
    /// Api call
    final response = await get(Uri.parse("${DataManager.getInstance().getCompanyDomain()}consumables?user_id=${DataManager.getInstance().getUserId()}"),
      headers:{
        "Authorization":"Bearer ${DataManager.getInstance().getCompanyToken()}",
        "Accept":"application/json"
      },
    );
    /// Decode api response and store in table
    var data = jsonDecode(response.body);
    List<con.ConsumablesData> res = [];
    res = data['rows'].map<con.ConsumablesData>((json) => con.ConsumablesData.fromJson(json)).toList();
    await dbHelper().getDb()!.then((value) {
      value.transaction((txn) async {
        var batch = txn.batch();
        for(int i=0;i<res.length;i++){
          var insertData = {
            'cId':res[i].id,
            'image':res[i].image,
            'name':res[i].name,
            'category':jsonEncode(res[i].category)??" ",
            'orderNumber':res[i].orderNumber??0,
            'location':res[i].location != null ? jsonEncode(res[i].location):jsonEncode(con.Location(id:0,name:' ')),
            'minQty':res[i].minAmt.toString()??0,
            'qty':res[i].qty.toString()??0,
            'avlQty':res[i].remaining.toString()??0
          };
          batch.insert('Consumable', insertData);
        }
        await batch.commit();
      });
    });
    return con.Consumables.fromJson(data);
  }
  Future<ConsumableUserModel>getConsumableDetailsUser({consumablesId}) async {
    /// Api call
    final response = await get(Uri.parse("${DataManager.getInstance().getCompanyDomain()}consumables/$consumablesId/users"),
      headers:{
        "Authorization":"Bearer ${DataManager.getInstance().getCompanyToken()}",
        "Accept":"application/json"
      },
    );
    /// Decode api response and return
    var data = jsonDecode(response.body);
    return ConsumableUserModel.fromJson(data);
  }
  Future<ConsumableLogsModel>getConsumableDetailsLogs({consumablesId}) async {
    /// Api call
    final response = await get(Uri.parse("${DataManager.getInstance().getCompanyDomain()}consumables/2/checkoutconsumablelog"),
      headers:{
        "Authorization":"Bearer ${DataManager.getInstance().getCompanyToken()}",
        "Accept":"application/json"
      },
    );
    /// Decode api response and return
    var data = jsonDecode(response.body);
    return ConsumableLogsModel.fromJson(data);
  }

  // licences
  Future<Licenses>getLicencesList() async {
    /// Clear local table
    dbHelper().getDb()!.then((value) {value.rawDelete("DELETE FROM Licences");});
    /// Api response
    final response = await get(Uri.parse("${DataManager.getInstance().getCompanyDomain()}licenses?user_id=${DataManager.getInstance().getUserId()}"),
      headers:{
        "Authorization":"Bearer ${DataManager.getInstance().getCompanyToken()}",
        "Accept":"application/json"
      },
    );
    /// Decode api response and store in table
    var data = jsonDecode(response.body);
    List<LicensesData> res = [];
    res = data['rows'].map<LicensesData>((json) => LicensesData.fromJson(json)).toList();
    await dbHelper().getDb()!.then((value) {
      value.transaction((txn) async {
        var batch = txn.batch();
        for(int i=0;i<res.length;i++){
          var insertData = {
            'lId':res[i].id,
            'name':res[i].name,
            'expDate':jsonEncode(res[i].expirationDate),
            'manufacturer':jsonEncode(res[i].manufacturer),
            'seats':num.parse(res[i].seats.toString()),
            'freeSeatsCount':num.parse(res[i].freeSeatsCount.toString())
          };
          batch.insert('Licences', insertData);
        }
        await batch.commit();
      });
    });
    return Licenses.fromJson(data);
  }

  // components
  Future<Components>getComponentsList() async {
    /// Clear local table
    dbHelper().getDb()!.then((value) {value.rawDelete("DELETE FROM Components");});
    /// Api call
    final response = await get(Uri.parse("${DataManager.getInstance().getCompanyDomain()}components?user_id=${DataManager.getInstance().getUserId()}"),
      headers:{
        "Authorization":"Bearer ${DataManager.getInstance().getCompanyToken()}",
        "Accept":"application/json"
      },
    );
    /// Decode api response and store in table
    var data = jsonDecode(response.body);
    List<ComponentData> res = [];
    res = data['rows'].map<ComponentData>((json) => ComponentData.fromJson(json)).toList();
    await dbHelper().getDb()!.then((value) {
      value.transaction((txn) async {
        var batch = txn.batch();
        for(int i=0;i<res.length;i++){
          var insertData = {
            'cId':res[i].id,
            'name':res[i].name,
            'image':res[i].image,
            'location':jsonEncode(res[i].location),
            'minQty':res[i].minAmt,
            'avlQty':res[i].remaining
          };
          batch.insert('Components', insertData);
        }
        await batch.commit();
      });
    });
    return Components.fromJson(data);
  }
  Future<ComponentsUser>getComponentsUser({componentId}) async {
    /// Api call
    final response = await get(Uri.parse("${DataManager.getInstance().getCompanyDomain()}components/$componentId/users"),
      headers:{
        "Authorization":"Bearer ${DataManager.getInstance().getCompanyToken()}",
        "Accept":"application/json"
      },
    );
    /// Decode api response and return
    var data = jsonDecode(response.body);
    return ComponentsUser.fromJson(data);
  }
  Future<ComponentsLogs>getComponentsLogs({componentId}) async {
    /// Api call
    final response = await get(Uri.parse("${DataManager.getInstance().getCompanyDomain()}components/$componentId/checkInoutlog"),
      headers:{
        "Authorization":"Bearer ${DataManager.getInstance().getCompanyToken()}",
        "Accept":"application/json"
      },
    );
    /// Decode api response and return
    var data = jsonDecode(response.body);
    return ComponentsLogs.fromJson(data);
  }

  // kits
  Future<Kits>getKitsList() async {
    /// Clear local table
    dbHelper().getDb()!.then((value) {value.rawDelete("DELETE FROM Kits");});
    /// Api call
    final response = await get(Uri.parse("${DataManager.getInstance().getCompanyDomain()}kits?user_id=${DataManager.getInstance().getUserId()}"),
      headers:{
        "Authorization":"Bearer ${DataManager.getInstance().getCompanyToken()}",
        "Accept":"application/json"
      },
    );
    /// Decode api response and store in table
    var data = jsonDecode(response.body);
    List<KitsData> res = [];
    res = data['rows'].map<KitsData>((json) => KitsData.fromJson(json)).toList();
    await dbHelper().getDb()!.then((value) {
      value.transaction((txn) async {
        var batch = txn.batch();
        for(int i=0;i<res.length;i++){
          var insertData = {
            'kId':res[i].id,
            'name':res[i].name
          };
          batch.insert('Kits', insertData);
        }
        await batch.commit();
      });
    });
    return Kits.fromJson(data);
  }

  Future<CategoryModels>getCategoryList() async {
    /// Clear local table
    dbHelper().getDb()!.then((value) {value.rawDelete("DELETE FROM Category");});
    /// Api call
    final response = await post(Uri.parse("${DataManager.getInstance().getCompanyDomain()}category-model-list"),
      headers: {
        "Authorization":"Bearer ${DataManager.getInstance().getCompanyToken()}",
        "Accept":"application/json"
      },
    );
    /// Decode api response and store in table
    var data = jsonDecode(response.body);
    List<Categorylist> res1 = [];
    List<Modelslist> res2 = [];
    if (data['api_status'] == 1) {
      res1 = data['categorylist'].map<Categorylist>((json) => Categorylist.fromJson(json)).toList();
      await dbHelper().getDb()!.then((value) {
        value.transaction((txn) async {
          var batch1 = txn.batch();
          for(int i = 0; i < res1.length; i++){
            var insertData = {
              'cId': res1[i].catId,
              'name':res1[i].catName,
            };
            batch1.insert('Category', insertData);
          }
          await batch1.commit();
          var batch2 = txn.batch();
          res2 = data['modelslist'].map<Modelslist>((json) => Modelslist.fromJson(json)).toList();
          for (int i = 0; i < res2.length; i++) {
            var insertData = {
              'cmId': res2[i].modelId,
              'name':res2[i].modelName,
              'catId': res2[i].catId,
              'catName':res2[i].catName,
            };
            batch2.insert('CategoryModels', insertData);
          }
          await batch2.commit();
        });
      });
    }
    return CategoryModels.fromJson(data);
  }

  Future<AssetsStatus>getAssetStatusList() async {
    /// Clear local table
    dbHelper().getDb()!.then((value) {value.rawDelete("DELETE FROM AssetStatus");});
    /// Api call
    final response = await post(Uri.parse("${DataManager.getInstance().getCompanyDomain()}get_my_asset_list?user_id=${DataManager.getInstance().getUserId()}"),
      headers: {
        "Authorization":"Bearer ${DataManager.getInstance().getCompanyToken()}",
        "Accept":"application/json"
      },
    );
    /// Decode api response and store in table
    var data = jsonDecode(response.body);
    List<AllUserAssetAssgainData> res = [];
    if (data['api_status'] == 1) {
      res = data['AllUserAssetAssgainData'].map<AllUserAssetAssgainData>((json) => AllUserAssetAssgainData.fromJson(json)).toList();
      await dbHelper().getDb()!.then((value) {
        value.transaction((txn) async {
          var batch = txn.batch();
          for (int i = 0; i < res.length; i++) {
            var insertData = {
              'asId': res[i].id,
              'name':res[i].name,
              'companyId': res[i].companyId,
              'userId': res[i].userId,
              'image': res[i].image,
              'modelName': res[i].modelName,
              'assetTag': res[i].assetTag,
              'location': res[i].location,
              'lastAuditDate': res[i].lastAuditDate,
              'companyName': res[i].companyName,
              'categoryName': res[i].categoryName,
              'purchaseDate': res[i].purchaseDate,
              'supplierName': res[i].supplierName,
              'warrantyMonths': res[i].warrantyMonths,
              'status':res[i].status,
              'assetStatus':res[i].assetStatus
            };
            batch.insert('AssetStatus', insertData);
          }
          await batch.commit();
        });
      });
    }
    return AssetsStatus.fromJson(data);
  }

  // transferable asset api
  Future<SelectStatusModel>getStatusList() async {
    /// Api call
    final response = await get(Uri.parse("${DataManager.getInstance().getCompanyDomain()}statuslabels"),
      headers: {
        "Authorization":"Bearer ${DataManager.getInstance().getCompanyToken()}",
        "Accept":"application/json"
      },
    );
    /// Decode api response and return
    var data = jsonDecode(response.body);
    return SelectStatusModel.fromJson(data);
  }
  Future<LocationModel>getLocationList() async {
    /// Api call
    final response = await get(Uri.parse("${DataManager.getInstance().getCompanyDomain()}locations/selectlist"),
      headers: {
        "Authorization":"Bearer ${DataManager.getInstance().getCompanyToken()}",
        "Accept":"application/json"
      },
    );
    /// Decode api response and return
    var data = jsonDecode(response.body);
    return LocationModel.fromJson(data);
  }
  Future<SelectAssetModel>getAssetsList() async {
    /// Api call
    final response = await get(Uri.parse("${DataManager.getInstance().getCompanyDomain()}hardware/selectlist"),
      headers: {
        "Authorization":"Bearer ${DataManager.getInstance().getCompanyToken()}",
        "Accept":"application/json"
      },
    );
    /// Decode api response and return
    var data = jsonDecode(response.body);
    return SelectAssetModel.fromJson(data);
  }
  Future<SelectUserModel>getUserList() async {
    ///Api call
    final response = await get(Uri.parse("${DataManager.getInstance().getCompanyDomain()}users/selectlist"),
      headers: {
        "Authorization":"Bearer ${DataManager.getInstance().getCompanyToken()}",
        "Accept":"application/json"
      },
    );
    /// Decode api response and return
    var data = jsonDecode(response.body);
    return SelectUserModel.fromJson(data);
  }

  Future assetCheckIn({assetId,bodyData}) async {
    /// Api call
    final response = await post(Uri.parse("${DataManager.getInstance().getCompanyDomain()}check-in-out/asset/$assetId/checkin?user_id=${DataManager.getInstance().getUserId()}"),
      headers: {
        "Accept":"application/json",
        "Authorization":"Bearer ${DataManager.getInstance().getCompanyToken()}"
      },
      body: bodyData,
    );
    /// Decode api response and return
    var data = jsonDecode(response.body);
    return data;
  }
  Future assetCheckOut({assetId,bodyData}) async {
    /// Api call
    final response = await post(Uri.parse("${DataManager.getInstance().getCompanyDomain()}check-in-out/asset/$assetId/checkout?user_id=${DataManager.getInstance().getUserId()}"),
      headers: {
        "Accept":"application/json",
        "Authorization":"Bearer ${DataManager.getInstance().getCompanyToken()}"
      },
      body: bodyData,
    );
    /// Decode api response and return

    var data = jsonDecode(response.body);
    return data;
  }
}