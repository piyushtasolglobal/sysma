
import 'dart:convert';

import 'package:adani/Dashboard/db/sqlite_service.dart';
import 'package:adani/Utils/CustomBorder.dart';
import 'package:adani/Utils/constants.dart';
import 'package:adani/controllar/Apis.dart';
import 'package:adani/controllar/data_manager.dart';
import 'package:adani/models/Preventive.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../Utils/Styles.dart';
import 'inspection_second.dart';

class InspectionFirstStep extends StatefulWidget {
  var auditScheduleId;
  InspectionFirstStep({Key? key, this.auditScheduleId}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _InspectionFirstStepState();
}

class _InspectionFirstStepState extends State<InspectionFirstStep> {
  MobileScannerController cameraController = MobileScannerController();
  TextEditingController tagIdController = TextEditingController();
  PreventiveScheduleData? data;
  List<PreventiveScheduleData> preventiveScheduleData=[];
  bool isScan=true;
  bool isLoad=true;
  var scanData;
  // loadAssetsLocal(){
  //   Loading().onLoading();
  //   dbHelper().getDb()!.then((value) {
  //     value.rawQuery("SELECT * From Schedule WHERE assetTag='${tagIdController.text}'").then((value) {
  //       for (var i in value){
  //         setState(() {
  //           data.add(PreventiveScheduleData(
  //             id : num.parse(i['id'].toString()),
  //             auditSchduleId: num.parse(i['auditSchduleId'].toString()),
  //             companyId: num.parse(i['companyId'].toString()),
  //             assetTagId:num.parse(i['assetTagId'].toString()),
  //             userId: num.parse(i['userId'].toString()),
  //             auditName: i['auditName'].toString(),
  //             auditStatus:i['auditStatus'].toString(),
  //             image: i['image'].toString(),
  //             modelName: i['modelName'].toString(),
  //             assetTag: i['assetTag'].toString(),
  //             location: i['location'].toString(),
  //             lastAuditDate: i['lastAuditDate'].toString(),
  //             escalatedAuditLevels: i['escalatedAuditLevels'].toString(),
  //             maintenanceType: i['maintenanceType'].toString(),
  //             companyName: i['companyName'].toString(),
  //             categoryName: i['categoryName'].toString(),
  //             purchaseDate: i['purchaseDate'].toString(),
  //             supplierName: i['supplierName'].toString(),
  //             warrantyMonths: num.parse(i['warrantyMonths'].toString()),
  //             auditParamsId:num.parse(i['auditParamsId'].toString()),
  //             auditParamsValues:jsonDecode(i['auditParamsValues'].toString()),
  //           ));
  //         });
  //       }
  //     });
  //   });
  //
  // }
  // loadAssetsLocal1({tagId}){
  //   Loading().onLoading();
  //   dbHelper().getDb()!.then((value) {
  //     value.rawQuery("SELECT * From Schedule WHERE assetTagId='$tagId'").then((value) {
  //       for (var i in value){
  //         setState(() {
  //           data.add(PreventiveScheduleData(
  //             id : num.parse(i['id'].toString()),
  //             auditSchduleId: num.parse(i['auditSchduleId'].toString()),
  //             companyId: num.parse(i['companyId'].toString()),
  //             assetTagId:num.parse(i['assetTagId'].toString()),
  //             userId: num.parse(i['userId'].toString()),
  //             auditName: i['auditName'].toString(),
  //             auditStatus:i['auditStatus'].toString(),
  //             image: i['image'].toString(),
  //             modelName: i['modelName'].toString(),
  //             assetTag: i['assetTag'].toString(),
  //             location: i['location'].toString(),
  //             lastAuditDate: i['lastAuditDate'].toString(),
  //             escalatedAuditLevels: i['escalatedAuditLevels'].toString(),
  //             maintenanceType: i['maintenanceType'].toString(),
  //             companyName: i['companyName'].toString(),
  //             categoryName: i['categoryName'].toString(),
  //             purchaseDate: i['purchaseDate'].toString(),
  //             supplierName: i['supplierName'].toString(),
  //             warrantyMonths: num.parse(i['warrantyMonths'].toString()),
  //             auditParamsId:num.parse(i['auditParamsId'].toString()),
  //             auditParamsValues:jsonDecode(i['auditParamsValues'].toString()),
  //           ));
  //         });
  //       }
  //     });
  //   });
  // }

  loadAssetsLocal(){
    Loading().onLoading();
    // for(var i in preventiveScheduleData){
    //   if(i.assetTag.toString() == tagIdController.text.toString()){
    //     setState(() {
    //       data = i;
    //     });
    //   }
    // }

    dbHelper().getDb()!.then((dbValue) {
      dbValue.rawQuery("SELECT * From Schedule WHERE assetTag='${tagIdController.text}' AND auditSchduleId='${widget.auditScheduleId}'").then((value) {
        for (var i in value){
          setState(() {
            data = PreventiveScheduleData(
              // id : num.parse(i['sId'].toString()),
              auditSchduleId: num.parse(i['auditSchduleId'].toString()),
              // companyId: num.parse(i['companyId'].toString()),
              assetTagId:num.parse(i['assetTagId'].toString()),
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
              purchaseDate: i['purchaseDate'].toString()??' ',
              supplierName: i['supplierName'].toString(),
              warrantyMonths: num.parse(i['warrantyMonths'].toString()),
              canCheckout: i['canCheckout'] != null ? num.parse(i['canCheckout'].toString()):0,
              canCheckin: i['canCheckin'] != null ? num.parse(i['canCheckin'].toString()):0,
              // auditParamsId:num.parse(i['auditParamsId'].toString()),
              auditParamsValues:jsonDecode(i['auditParamsValues'].toString()),
              statusLabel:i['statusLabel'].toString(),
              dueDate:i['dueDate'].toString(),
            );
          });
        }
      });
    });
  }
  loadAssetsLocal1({tagId}){
    Loading().onLoading();
    // for(var i in preventiveScheduleData){
    //   if(i.assetTagId.toString() == tagId.toString()){
    //     setState(() {
    //       data = i;
    //     });
    //   }
    // }

    dbHelper().getDb()!.then((value) {
      value.rawQuery("SELECT * From Schedule WHERE assetTagId='$tagId' AND auditSchduleId='${widget.auditScheduleId}'").then((value) {
        for (var i in value){
          setState(() {
            data = PreventiveScheduleData(
              // id : num.parse(i['sId'].toString()),
              auditSchduleId: num.parse(i['auditSchduleId'].toString()),
              // companyId: num.parse(i['companyId'].toString()),
              assetTagId:num.parse(i['assetTagId'].toString()),
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
              purchaseDate: i['purchaseDate'].toString()??' ',
              supplierName: i['supplierName'].toString(),
              warrantyMonths: num.parse(i['warrantyMonths'].toString()),
              canCheckout: i['canCheckout'] != null ? num.parse(i['canCheckout'].toString()):0,
              canCheckin: i['canCheckin'] != null ? num.parse(i['canCheckin'].toString()):0,
              // auditParamsId:num.parse(i['auditParamsId'].toString()),
              auditParamsValues:jsonDecode(i['auditParamsValues'].toString()),
              statusLabel:i['statusLabel'].toString(),
              dueDate:i['dueDate'].toString(),
            );
          });
        }
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // loadPreventive();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          color: Colors.white,
          icon: ValueListenableBuilder(
            valueListenable: cameraController.cameraFacingState,
            builder: (context, state, child) {
              switch (state as CameraFacing) {
                case CameraFacing.front:
                  return const Icon(Icons.flip_camera_ios_outlined);
                case CameraFacing.back:
                  return const Icon(Icons.flip_camera_ios_outlined);
              }
            },
          ),
          iconSize: 32.0,
          onPressed: () => cameraController.switchCamera(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: IconButton(
              color: Colors.white,
              icon: ValueListenableBuilder(
                valueListenable: cameraController.torchState,
                builder: (context, state, child) {
                  switch (state as TorchState) {
                    case TorchState.off:
                      return const Icon(Icons.flash_off);
                    case TorchState.on:
                      return const Icon(Icons.flash_on,);
                  }
                },
              ),
              iconSize: 32.0,
              onPressed: () => cameraController.toggleTorch(),
            ),
          ),
        ],
        leadingWidth: 100,

      ),
      bottomSheet: Container(
        color: Colors.black87,
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width*0.4,
              child: TextFormField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                controller: tagIdController,
                style: wlistTitleHeading,
                textAlign: TextAlign.center,
                decoration:InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 12),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: white, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: white, width: 1.0),
                    ),
                    filled: true,
                    fillColor:Colors.transparent,
                    hintText: "Tag ID",
                    hintStyle:  wlistTitleHeading,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(width: 1,color: white),gapPadding: 0)
                ),
              ),
            ),
            const SizedBox(width: 30,),
            InkWell(
                onTap: (){
                  loadAssetsLocal();
                  Future.delayed(const Duration(seconds: 2),() {
                    Loading().onDone();
                    if(data != null){
                      try{
                        var md = jsonDecode(data!.auditParamsValues.toString());
                        if(md.length == 0){
                          AwesomeDialog(
                            context: context,
                            dismissOnTouchOutside: false,
                            dialogType: DialogType.error,
                            animType: AnimType.topSlide,
                            headerAnimationLoop: true,
                            title: 'Data Not Found \n\n${tagIdController.text}',
                            titleTextStyle: title,
                            descTextStyle: greysubtext,
                            desc:'Audit parameter value is not found.',
                            btnOkOnPress: () {
                              setState(() {
                                isScan=true;
                              });
                            },
                            btnOkIcon: Icons.qr_code_2_outlined,
                            btnOkColor: primarycolor,
                            btnOkText: 'Rescan',
                          ).show();
                        }else{
                          Navigator.push(context, MaterialPageRoute(builder: (context) => InspectionSecondStep(sdata: data,))).then((value){
                            setState(() {
                              data = null;
                              isScan = true;
                            });
                            Navigator.pop(context);
                          });
                        }
                      }catch(e){
                        print(e);
                      }
                    }else{
                      AwesomeDialog(
                        context: context,
                        dismissOnTouchOutside: false,
                        dialogType: DialogType.error,
                        animType: AnimType.topSlide,
                        headerAnimationLoop: true,
                        title: 'Asset Not Found',
                        titleTextStyle: title,
                        descTextStyle: greysubtext,
                        desc:'The QR is invalid or has been assigned to another asset.\n Please Rescan/Scan another QR code. \n ${tagIdController.text}',
                        btnOkOnPress: () {},
                        btnOkIcon: Icons.qr_code_2_outlined,
                        btnOkColor: primarycolor,
                        btnOkText: 'Rescan',
                      ).show();
                    }
                    tagIdController.clear();
                  },);
                },
                child: const Icon(Icons.navigate_next,color: white,size: 40,)),
          ],
        ),
      ),
      body:  Center(
        child:CustomPaint(
          foregroundPainter: BorderPainter(),
          child: Container(
            padding: EdgeInsets.zero,margin: EdgeInsets.zero,
            height: MediaQuery.of(context).size.height*0.3,
            width: MediaQuery.of(context).size.width*0.6,
            child: _buildQrView(context),
          ),
        ),
      )
    );
  }

  Widget _buildQrView(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(17),
      child:
      // isLoad==true?const Center(child: CircularProgressIndicator(color: primarycolor),):
      MobileScanner(
          allowDuplicates: true,
          fit: BoxFit.cover,
          controller: cameraController,
          onDetect: (barcode, args) {
            if(isScan) {
              setState(() {
                isScan = false;
              });
              if (barcode.rawValue == null) {
                // AwesomeDialog(
                //   context: context,
                //   dismissOnTouchOutside: false,
                //   dialogType: DialogType.error,
                //   animType: AnimType.topSlide,
                //   headerAnimationLoop: true,
                //   title: 'Asset Not Found',
                //   titleTextStyle: title,
                //   descTextStyle: greysubtext,
                //   desc:'The QR is invalid or has been assigned to another asset.\n Please Rescan/Scan another QR code.',
                //   btnOkOnPress: () {},
                //   btnOkIcon: Icons.qr_code_2_outlined,
                //   btnOkColor: primarycolor,
                //   btnOkText: 'Rescan',
                // ).show();
                debugPrint('Failed to scan Barcode');
              } else {
                final String code = barcode.rawValue!;
                setState(() {scanData=code;});
                loadAssetsLocal1(tagId: code.split('/').last);
                Future.delayed(const Duration(seconds: 2),() {
                  Loading().onDone();
                  if(data != null){
                    try{
                      var md = jsonDecode(data!.auditParamsValues.toString());
                      if(md.length == 0){
                        AwesomeDialog(
                          context: context,
                          dismissOnTouchOutside: false,
                          dialogType: DialogType.error,
                          animType: AnimType.topSlide,
                          headerAnimationLoop: true,
                          title: 'Data Not Found \n\n$scanData',
                          titleTextStyle: title,
                          descTextStyle: greysubtext,
                          desc:'Audit parameter value is not found.',
                          btnOkOnPress: () {
                            setState(() {
                              isScan=true;
                            });
                          },
                          btnOkIcon: Icons.qr_code_2_outlined,
                          btnOkColor: primarycolor,
                          btnOkText: 'Rescan',
                        ).show();
                      }else{
                        Navigator.push(context, MaterialPageRoute(builder: (context) => InspectionSecondStep(sdata: data,))).then((value){
                          setState(() {
                            data =  null;
                            isScan = true;
                          });
                          Navigator.pop(context);
                        });
                      }
                    }catch(e){
                      print(e);
                    }
                  }else{
                    AwesomeDialog(
                      context: context,
                      dismissOnTouchOutside: false,
                      dialogType: DialogType.error,
                      animType: AnimType.topSlide,
                      headerAnimationLoop: true,
                      title: 'Asset Not Found \n\n$scanData',
                      titleTextStyle: title,
                      descTextStyle: greysubtext,
                      desc:'The QR is invalid or has been assigned to another asset.\n Please Rescan/Scan another QR code. ',
                      btnOkOnPress: () {
                        setState(() {
                          isScan=true;
                        });
                      },
                      btnOkIcon: Icons.qr_code_2_outlined,
                      btnOkColor: primarycolor,
                      btnOkText: 'Rescan',
                    ).show();
                    tagIdController.clear();
                  }
                },);
                debugPrint('Barcode found! $code');
              }
            }

          }),
    );
  }
}