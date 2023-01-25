
import 'dart:convert';
import 'package:adani/Dashboard/db/sqlite_service.dart';
import 'package:adani/Utils/Styles.dart';
import 'package:adani/Utils/constants.dart';
import 'package:adani/controllar/data_manager.dart';
import 'package:adani/models/demo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../Utils/App_bar.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> with SingleTickerProviderStateMixin  {
  late final AnimationController _controller;
  late final Animation<double> animation;
  bool isSync = false;
  @override
  void initState() {
    _controller = AnimationController(vsync: this,duration: const Duration(milliseconds: 0000))..forward();
    super.initState();
    animation = Tween(begin: 0.0, end: 0.1).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Demo> insData=[];
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar().getAppbar(context, "Settings"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            Center(
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60),),
                color: primarycolor,
                child:   Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: RotationTransition(
                    turns:_controller,
                    child: const Icon(Icons.refresh,color: white,size: 64,),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: ElevatedButton(
                onPressed: isSync == false? () async {
                  if(DataManager.getInstance().getConnection()) {
                    setState(() {
                      isSync = true;
                    });
                    _controller.duration = const Duration(milliseconds: 1000);
                    _controller.repeat();
                    setState(() {
                      isVisible = !isVisible;
                    },);
                    try {
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

                                print('response');
                                print(jsonDecode(responseString));
                                if (streamResponse.statusCode == 200) {
                                  // value.rawUpdate("UPDATE InspectedSchedule SET status =? WHERE auditSchduleId = ?",[1,fdata['audit_schedule_id'],]);
                                  value.rawUpdate("UPDATE CompletedSchedule SET status =? WHERE auditSchduleId = ?",[1,fdata['audit_schedule_id'],]);
                                  value.rawDelete("DELETE From InspectionData WHERE id =?",[d['id'],]);
                                  final dynamic jsonMap = json.decode(responseString);
                                  _controller.stop();
                                  setState(() {isSync = false;});
                                  Loading().onSuccess(msg: jsonMap['api_message']);
                                } else {
                                  final dynamic jsonMap = json.decode(responseString);
                                  print(jsonMap);
                                  // value.rawUpdate("UPDATE InspectedSchedule SET status =?,response =? WHERE auditSchduleId = ?", [2,jsonMap['message'],fdata['audit_schedule_id'],]);
                                  value.rawUpdate("UPDATE CompletedSchedule SET status =?,response =? WHERE auditSchduleId = ?", [2,jsonMap['message'],fdata['audit_schedule_id'],]);
                                  value.rawDelete("DELETE From InspectionData WHERE id =?",[d['id'],]);
                                  _controller.stop();
                                  setState(() {isSync = false;});
                                  Loading().onError(msg: jsonMap['message']);
                                }
                                // request.send().then((vl) async {
                                //     var res = await Response.fromStream(vl);
                                //     try {
                                //     print('=========server response==========');
                                //     print(res.body);
                                //     _controller.stop();
                                //     setState(() {
                                //       isSync = false;
                                //     });
                                //     Loading().onSuccess(msg: "Data sync completed");
                                //     }catch(e){
                                //       print(e);
                                //     }
                                //   });

                                // request.send().then((value) async {
                                //   Response.fromStream(value).then((response) {
                                //     print('=========server response==========');
                                //     print(response);
                                //     _controller.stop();
                                //     setState(() {isSync = false;});
                                //     Loading().onSuccess(msg: "Data sync completed");
                                //   });
                                // });
                              }catch(e){
                                print(e);
                              }
                            }
                          }else{
                            _controller.stop();
                            setState(() {
                              isSync = false;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("No inspection found in local storage")),);
                          }
                        });
                      });
                    } catch (e) {
                      print(e);
                    }
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Check your internet connection")),);
                  }
                }:null,
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width, 50),
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
                  backgroundColor: Colors.black,
                ),

                child: const Text("Sync Data",style: buttontextstyle),
              ),
            ),
            const SizedBox(height: 10,),
            Visibility(
              visible:!isVisible ,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Last Synced : ",style: greysubtext,),
                  Text(" 23-09-2022 20:27:23",style: greytext,)
                ],
              ),
            ),
          ],),
      ),
    );
  }
}
