import 'dart:convert';
import 'dart:io';
import 'package:adani/Dashboard/dashboard_screen.dart';
import 'package:adani/Dashboard/db/sqlite_service.dart';
import 'package:adani/Utils/App_bar.dart';
import 'package:adani/Utils/Styles.dart';
import 'package:adani/Utils/constants.dart';
import 'package:adani/controllar/Apis.dart';
import 'package:adani/controllar/data_manager.dart';
import 'package:adani/models/Preventive.dart';
import 'package:adani/models/demo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class InspectionPreview extends StatefulWidget {
  List insList;
  List insIds;
  List insParamTrans;
  PreventiveScheduleData?sdata;
  var assetPic;
  var psi;
  InspectionPreview({Key? key, required this.insList,required this.insIds,required this.insParamTrans, this.sdata,this.psi, this.assetPic}) : super(key: key);
  @override
  State<InspectionPreview> createState() => _InspectionPreviewState();
}

class _InspectionPreviewState extends State<InspectionPreview> {
  List<dynamic> assetParameterValue = [];
  List assetInsValue = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    assetParameterValue= jsonDecode(widget.sdata!.auditParamsValues.toString());
    assetInsValue = widget.insList.reversed.toList();
  }
  prepData(){
    String isData = "user_id%${DataManager.getInstance().getUserId().toString()}#audit_status%completed#audit_schedule_id%${widget.sdata!.auditSchduleId.toString()}#type%${widget.sdata!.auditStatus.toString()}#"
        "lat_long%37.785834,-122.406417#maintenance_type%${widget.sdata!.maintenanceType.toString()}#";
    for(var i=0; i <= assetParameterValue.length-1; i++){
      setState((){
        isData = "$isData${assetParameterValue[i]['id']}%${assetInsValue[i]['dropDownValue']}#";
      });
    }
    for(var i=0; i<= assetParameterValue.length-1; i++){
      setState((){
        isData = "$isData${assetParameterValue[i]['id']}_comment%${assetInsValue[i]['commentValue']}#";
      });
    }
    return isData;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar().getAppbar(context, "Fill Parameters"),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 55),
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        children: [
          widget.assetPic == null?
          const Icon(Icons.camera_alt_outlined,size: 150,color: primarycolor,):
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Image.file(File(widget.assetPic!.path),height: 150,),
          ),
          const Divider(color: grey_400,thickness: 3,height: 0,),
          Container(
            color: grey_400,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: assetParameterValue.length,
              itemBuilder: (context, index) {
                var data = assetParameterValue[index];
                return Card(
                  color: Colors.white,
                  elevation: 1,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  margin: const EdgeInsets.only(bottom: 5),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data['param_disp_name'],style: heading,),
                        Container(
                          padding: const EdgeInsets.only(left: 10),
                          margin: const EdgeInsets.only(bottom: 10,top: 10),
                          height: 40,
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            border: Border.all(color: grey_400),
                          ),
                          child: data['param_type'] != 'Number'?
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(assetInsValue[index]['dropDownValue'],style: listHeading,),
                              const Icon(Icons.arrow_drop_down_outlined,size: 24,color: primarycolor,)
                            ],
                          ):
                          Text(assetInsValue[index]['dropDownValue'],style: listHeading,),
                        ),
                        Row(
                          children: [
                            assetInsValue[index]['imageValue'] == null?
                            const SizedBox():
                            InkWell(
                              onTap:() async {
                                XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.camera,);
                                if (pickedFile != null) {
                                  assetInsValue[index]['imageValue'] = pickedFile;
                                  setState(() {});
                                }
                              },
                              child: Image.file(File(assetInsValue[index]['imageValue'].path),height: 150,width: 150,),
                            ),

                            Flexible(
                              child: assetInsValue[index]['commentValue']!=null?
                              Container(
                                padding: const EdgeInsets.only(left: 10),
                                // margin: const EdgeInsets.only(left: 10),
                                height: assetInsValue[index]['imageValue'] == null?50:150,
                                alignment: Alignment.topLeft,
                                decoration: BoxDecoration(
                                  border: Border.all(color: grey_400),
                                ),
                                child: Text(assetInsValue[index]['commentValue'],style: listHeading,),
                              ):
                              const SizedBox(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: const EdgeInsets.only(top:0,bottom: 10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 55.0),
            backgroundColor: primarycolor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () async {
            Loading().onLoading();
            String isImages="";
            for (var i = 0; i <= assetParameterValue.length - 1; i++) {
              if(assetInsValue[i]['imageValue'] != null) {
                setState(() {
                  isImages = "$isImages${assetParameterValue[i]['id']}_img%${assetInsValue[i]['imageValue'].path}#";
                });
              }
            }
            if(DataManager.getInstance().getConnection()){
              Map<String, String> finalData = {
                "data": prepData().toString(),
                "images": isImages.toString(),
                "assetImage": widget.assetPic.path.toString()
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
                var request = MultipartRequest('POST', Uri.parse(
                    "${DataManager.getInstance()
                        .getCompanyDomain()}submit_type_inspection_info"));
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
                print('=========server response==========');
                var streamResponse = await request.send();
                final responseString = await streamResponse.stream.bytesToString();
                if (streamResponse.statusCode == 200) {
                  await dbHelper().getDb()!.then((value) {
                    value.transaction((txn) async {
                      var batch = txn.batch();
                      var insertData = {
                        'auditSchduleId': widget.sdata!.auditSchduleId,
                        'assetTagId': widget.sdata!.assetTagId,
                        'auditName': widget.sdata!.auditName,
                        'auditStatus': widget.sdata!.auditStatus,
                        'image': widget.sdata!.image,
                        'assetImage': widget.sdata!.assetImage,
                        'modelName': widget.sdata!.modelName,
                        'assetTag': widget.sdata!.assetTag,
                        'location': widget.sdata!.location ?? ' ',
                        'auditEndDate': widget.sdata!.auditEndDate,
                        'auditInspectionDate': DateFormat('yyyy-MM-dd hh:mm:ss').format(DateTime.now()),
                        'auditInspectionDateF': DateFormat('yyyy-MM-dd').format(DateTime.now()),
                        'scheduleExpireDate': widget.sdata!.scheduleExpireDate != null ? DateFormat("yyyy-MM-dd")
                            .format(
                            DateTime.parse(widget.sdata!.scheduleExpireDate.toString()))
                            .toString()
                            : "0000-00-00",
                        'escalatedAuditLevels':widget.sdata!.escalatedAuditLevels ?? 0,
                        'maintenanceType': widget.sdata!.maintenanceType,
                        'companyName': widget.sdata!.companyName ?? ' ',
                        'categoryName': widget.sdata!.categoryName ?? ' ',
                        'purchaseDate': widget.sdata!.purchaseDate ?? ' ',
                        'supplierName': widget.sdata!.supplierName ?? ' ',
                        'warrantyMonths': widget.sdata!.warrantyMonths ?? 0,
                        'canCheckout': 0,
                        'canCheckin': 0,
                        'auditParamsValues': jsonEncode(widget.sdata!.auditParamsValues),
                        'auditParamsTransaction': jsonEncode(widget.insParamTrans),
                        'inspectionBy': DataManager.getInstance().getUserName(),
                        'status':1,
                        'insFrom':0,
                        'response':'',
                        'userId':DataManager.getInstance().getUserId()
                      };
                      batch.insert('CompletedSchedule', insertData);
                      batch.rawDelete("DELETE From Schedule WHERE auditSchduleId = ?",[ widget.sdata!.auditSchduleId,]);
                      await batch.commit();
                    });
                  });
                  final dynamic jsonMap = json.decode(responseString);
                  print(jsonMap);
                  Loading().onSuccess(msg: jsonMap['api_message']);
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Dashboard(index: 2,from: 'inspection'),), (route) => false);
                }
                else {
                  final dynamic jsonMap = json.decode(responseString);
                  print(jsonMap);
                  Loading().onError(msg: jsonMap['message']);
                }
              }catch(e){
                print(e);
              }
            }
            else{
              Api().saveInspectionInfo(Demo(data: prepData().toString(),
                  images: isImages,
                  assetImage: widget.assetPic.path)).then((resValue) async {
                await dbHelper().getDb()!.then((value) {
                  value.transaction((txn) async {
                    var batch = txn.batch();
                    var insertData = {
                      'auditSchduleId': widget.sdata!.auditSchduleId,
                      'assetTagId': widget.sdata!.assetTagId,
                      'auditName': widget.sdata!.auditName,
                      'auditStatus': widget.sdata!.auditStatus,
                      'image': widget.sdata!.image,
                      'assetImage': widget.sdata!.assetImage,
                      'modelName': widget.sdata!.modelName,
                      'assetTag': widget.sdata!.assetTag,
                      'location': widget.sdata!.location ?? ' ',
                      'auditEndDate': widget.sdata!.auditEndDate,
                      'auditInspectionDate': DateFormat('yyyy-MM-dd hh:mm:ss')
                          .format(DateTime.now()),
                      'auditInspectionDateF': DateFormat('yyyy-MM-dd').format(
                          DateTime.now()),
                      'scheduleExpireDate': widget.sdata!.scheduleExpireDate !=
                          null ? DateFormat("yyyy-MM-dd")
                          .format(
                          DateTime.parse(
                              widget.sdata!.scheduleExpireDate.toString()))
                          .toString()
                          : "0000-00-00",
                      'escalatedAuditLevels': widget.sdata!
                          .escalatedAuditLevels ?? 0,
                      'maintenanceType': widget.sdata!.maintenanceType,
                      'companyName': widget.sdata!.companyName ?? ' ',
                      'categoryName': widget.sdata!.categoryName ?? ' ',
                      'purchaseDate': widget.sdata!.purchaseDate ?? ' ',
                      'supplierName': widget.sdata!.supplierName ?? ' ',
                      'warrantyMonths': widget.sdata!.warrantyMonths ?? 0,
                      'canCheckout': 0,
                      'canCheckin': 0,
                      'auditParamsValues': jsonEncode(
                          widget.sdata!.auditParamsValues),
                      'auditParamsTransaction': jsonEncode(
                          widget.insParamTrans),
                      'inspectionBy': DataManager.getInstance().getUserName(),
                      'status': 0,
                      'insFrom': 0,
                      'response': '',
                      'userId': DataManager.getInstance().getUserId()
                    };
                    // batch.insert('InspectedSchedule', insertData);
                    batch.insert('CompletedSchedule', insertData);
                    batch.rawDelete(
                        "DELETE From Schedule WHERE auditSchduleId = ?",
                        [ widget.sdata!.auditSchduleId,]);
                    await batch.commit();
                  });
                });
                Loading().onSuccess(msg: "Inspection Saved Locally");
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                  builder: (context) => Dashboard(index: 2,from: 'inspection'),), (
                    route) => false);
              });
            }
          },
          child: const Text("Submit",style: buttontextstyle),
        ),
      ),
    );
  }
}
