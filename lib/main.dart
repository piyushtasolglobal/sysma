
import 'dart:convert';
import 'dart:developer';
import 'package:adani/Dashboard/db/sqlite_service.dart';
import 'package:adani/Utils/Styles.dart';
import 'package:adani/controllar/data_manager.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';



import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Dashboard/TESTPUSH.dart';
import 'Dashboard/Notification_Listpage.dart';
import 'Utils/local_notification_service.dart';
import 'auth/splash_screen.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

import '../Utils/local_notification_service.dart';
import '../models/PushNotification.dart';



Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}
// bool shouldUseFirebaseEmulator = false;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  LocalNotificationService.initialize();

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

class _MyAppState extends State<MyApp>
{
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


  late int _totalNotifications;
  late final FirebaseMessaging _messaging;
  PushNotification ? _notificationInfo;
  late bool is_paramget;
  late SharedPreferences prefs ;


  @override
  initState()  {
    // TODO: implement initState
    super.initState();

    is_paramget=false;
    _totalNotifications = 0;
    intializeFirebase();
    getToken();
    registerNotification();
    checkForInitialMessage();
    firebaselisten();

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

  void firebaselisten() async
  {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message)
    {
      PushNotification notification = PushNotification(
        title: message.notification?.title,
        body: message.notification?.body, dataTitle: '', dataBody: '',
      );
      setState(() {
        _notificationInfo = notification;
        _totalNotifications++;
      });
    });
  }

  Future<void> intializeFirebase() async{
    // 1. This method call when app in terminated state and you get a notification
    // when you click on notification app open from terminated state and you can get notification data in this method
    prefs = await SharedPreferences.getInstance();

    await FirebaseMessaging.instance.getInitialMessage().then(
          (message) {
        print("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          print("New Notification");
          LocalNotificationService.createanddisplaynotification(message);

          /*setState(() {
            _notificationInfo?.dataBody = message.data['body'];
            print(_notificationInfo!.dataBody);
            _notificationInfo?.dataTitle = message.data['title'];
            print(_notificationInfo!.dataTitle);
          });*/

          if (message.data['asset_ids'] != null) {
            prefs.setString("assetids", message.data['asset_ids']);
            prefs.setBool("is_paramget", true);
          }

          if(message.data['pm_ids'] != null)
          {
            prefs.setString("pmids", message.data['pm_ids']);
            prefs.setBool("is_paramget", true);
          }

          if (message.data['asset_ids'] != null) {
            is_paramget=true;
            Get.to(Notification_List());
          }


        }
      },
    );

    // 2. This method only call when App in foreground it mean app must be opened
    await FirebaseMessaging.onMessage.listen(
          (message) {
        print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          //print("message.data11 ${message.data}");
          // LocalNotificationService.display(message);

          if (message.data['asset_ids'] != null) {
            prefs.setString("assetids", message.data['asset_ids']);
            prefs.setBool("is_paramget", true);

          }

          if(message.data['pm_ids'] != null)
          {
            prefs.setString("pmids", message.data['pm_ids']);
            prefs.setBool("is_paramget", true);

          }

          if (message.data['asset_ids'] != null) {
            is_paramget=true;
            Get.to(Notification_List());
          }

        }
      },
    );


    // 3. This method only call when App in background and not terminated(not closed)
    await  FirebaseMessaging.onMessageOpenedApp.listen(
          (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          //print(message.notification!.title);
          //print(message.notification!.body);
          //print("message.data22 ${message.data['_id']}");

          if (message.data['asset_ids'] != null) {
            prefs.setString("assetids", message.data['asset_ids']);
            prefs.setBool("is_paramget", true);

          }
          if(message.data['pm_ids'] != null)
          {
            prefs.setString("pmids", message.data['pm_ids']);
            prefs.setBool("is_paramget", true);

          }

          if (message.data['asset_ids'] != null) {
            is_paramget=true;
            Get.to(Notification_List());
          }

        }
      },
    );

  }


   void getToken () async{
     await FirebaseMessaging.instance.getToken().then((newtoken){
       print("fcm token");
       print(newtoken);
     }
     );
   }


  void registerNotification() async
  {
    // 1. Initialize the Firebase app
    await Firebase.initializeApp();

    // 2. Instantiate Firebase Messaging
    _messaging = FirebaseMessaging.instance;

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // 3. On iOS, this helps to take the user permissions
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized)
    {
      //print('User granted permission');

      FirebaseMessaging.onMessage.listen((RemoteMessage message)
      {

        /*if (_notificationInfo != null)
        {
          // For displaying the notification as an overlay
          showSimpleNotification
            (
            Text(_notificationInfo!.title!),
            leading: NotificationBadge(totalNotifications: _totalNotifications),
            subtitle: Text(_notificationInfo!.body!),
            background: Colors.cyan.shade700,
            duration: Duration(seconds: 2),
          );
        }*/

        // Parse the message received
        PushNotification notification = PushNotification(
          title: message.notification?.title,
          body: message.notification?.body,
          dataTitle: message.data['title'],
          dataBody: message.data['body'],
        );

        setState(() {
          _notificationInfo = notification;
          _totalNotifications++;
        });
      });

    } else {
      print('User declined or has not accepted permission');
    }
  }

  Future _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    print("Handling a background message: ${message.messageId}");
  }

  // For handling notification when the app is in terminated state
  checkForInitialMessage() async {
    await Firebase.initializeApp();
    RemoteMessage? initialMessage =
    await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      PushNotification notification = PushNotification(
        title: initialMessage.notification?.title,
        body: initialMessage.notification?.body,
      );
      setState(() {
        _notificationInfo = notification;
        _totalNotifications++;
      });
    }
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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sysma',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const splash(),   /*is_paramget ?  const splash() : Notification_List()*/
      builder: EasyLoading.init(),
    );
  }
}
