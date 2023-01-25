
import 'dart:convert';
import 'dart:developer';
import 'package:adani/Dashboard/db/sqlite_service.dart';
import 'package:adani/Utils/Styles.dart';
import 'package:adani/controllar/data_manager.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart';
import 'auth/splash_screen.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

// bool shouldUseFirebaseEmulator = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // FirebaseCrashlytics.instance.crash();

  runApp(const MyApp());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.dualRing
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 35.0
    ..fontSize = 14.0
    ..radius = 5.0
    ..progressColor = primarycolor
    ..backgroundColor = Colors.white
    ..indicatorColor = primarycolor
    ..textColor = primarycolor
    ..maskColor = Colors.white
    ..userInteractions = false
    ..dismissOnTap = false;
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    enableCrashlytics();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      log(result.name);
      if(result.name == 'wifi' || result.name == 'mobile'){
        DataManager.getInstance().setConnection(true);
        scheduleSyncToServer();
      }else{
        DataManager.getInstance().setConnection(false);
      }
    });
  }

  enableCrashlytics() async {
    // if (kDebugMode) {
      // Force disable Crashlytics collection while doing every day development.
      // Temporarily toggle this to true if you want to test crash reporting in your app.
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    // }
  }

  scheduleSyncToServer() async {
    print("== All local schedule sync to server ==");

    await dbHelper().getDb()!.then((value) {
      value.rawQuery("SELECT * From InspectionData").then((v) async {
        if(v.isNotEmpty) {
          for (var d in v) {
            Map<String, String> finalData = {
              "data": d['data'].toString(),
              "images": d['images'].toString(),
              "assetImage": d['assetImage'].toString()
            };
            var splitedData = finalData['data']!.split('#');
            Map<String, String> fdata = {};
            var splitedImages = finalData['images']!.split('#');
            for (var e = 0; e <= splitedData.length - 1; e++) {
              var sp = splitedData[e].split('%');
              setState(() {
                fdata[sp.first] = sp.last;
              });
            }
            try {
              var request = MultipartRequest('POST',Uri.parse("${DataManager.getInstance().getCompanyDomain()}submit_type_inspection_info"));
              request.fields.addAll(fdata);
              request.files.add(await MultipartFile.fromPath("asset_img", finalData['assetImage']!));
              for (var i = 0; i < splitedImages.length - 1; i++) {
                var img = splitedImages[i].split('%');
                request.files.add(await MultipartFile.fromPath(img.first, img.last));
              }
              request.headers.addAll({
                "Authorization": "Bearer ${DataManager.getInstance().getCompanyToken()}",
                "Accept": "application/json",
                "Content-type": "multipart/form-data"
              });

              var streamResponse = await request.send();
              final responseString = await streamResponse.stream.bytesToString();
              if (streamResponse.statusCode == 200) {
                // value.rawDelete("DELETE From InspectedSchedule WHERE auditSchduleId = ?",
                //     [fdata['audit_schedule_id'],]);
                // value.rawUpdate("UPDATE InspectedSchedule SET status =? WHERE auditSchduleId = ?", [1,fdata['audit_schedule_id'],]);
                value.rawUpdate("UPDATE CompletedSchedule SET status =? WHERE auditSchduleId = ?", [1,fdata['audit_schedule_id'],]);
                value.rawDelete("DELETE From InspectionData WHERE id =?",[d['id'],]);
                final dynamic jsonMap = json.decode(responseString);
                print(jsonMap);

              } else {
                final dynamic jsonMap = json.decode(responseString);
                print(jsonMap);
                // value.rawUpdate("UPDATE InspectedSchedule SET status =?,response =? WHERE auditSchduleId = ?",
                //     [2,jsonMap['message'],fdata['audit_schedule_id'],]);
                value.rawUpdate("UPDATE CompletedSchedule SET status =?,response =? WHERE auditSchduleId = ?",
                    [2,jsonMap['message'],fdata['audit_schedule_id'],]);
                value.rawDelete("DELETE From InspectionData WHERE id =?",[d['id'],]);
              }
            }catch(e){
              print(e);
            }
          }
        }else{
          print("No inspection found in local storage");
        }
      });
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sysma',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const splash(),
      builder: EasyLoading.init(),
    );
  }
}
