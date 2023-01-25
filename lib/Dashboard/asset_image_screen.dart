import 'dart:convert';

import 'package:adani/Dashboard/asset_check_in.dart';
import 'package:adani/Dashboard/asste_check_out.dart';
import 'package:adani/Dashboard/db/sqlite_service.dart';
import 'package:adani/Dashboard/inspection_first.dart';
import 'package:adani/Utils/constants.dart';
import 'package:adani/Utils/textfield_style.dart';
import 'package:adani/controllar/data_manager.dart';
import 'package:adani/models/Completed.dart';
import 'package:adani/models/Preventive.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:intl/intl.dart';
import '../Utils/App_bar.dart';
import '../Utils/Styles.dart';

class Asset_image extends StatefulWidget {
  List<PreventiveScheduleData>?assetScheduleData;
  List<CompletedScheduleData>?completedScheduleData;
  Asset_image({Key? key, this.assetScheduleData, this.completedScheduleData}) : super(key: key);
  @override
  State<Asset_image> createState() => _Asset_imageState();
}

class _Asset_imageState extends State<Asset_image> {
  var renderOverlay = true;
  var visible = true;
  var switchLabelPosition = true;
  var switchLabelPositionR = false;
  var extend = false;
  var customDialRoot = false;
  var closeManually = false;
  var useRAnimation = true;
  var isDialOpen = ValueNotifier<bool>(false);
  var isDialOpenR = ValueNotifier<bool>(false);
  var speedDialDirection = SpeedDialDirection.up;
  var buttonSize = const Size(56.0, 56.0);
  var childrenButtonSize = const Size(56.0, 56.0);

  bool loading = true;
  List<PmHistory> pmHistory=[];
  loadPmHistoryLocal(id){
    pmHistory.clear();
    dbHelper().getDb()!.then((value) {
      //value.rawQuery("SELECT * From PMHistory WHERE auditSchduleId=$id").then((value) // old query wriiten previously
       value.rawQuery("SELECT DISTINCT auditSchduleId,assetTagId,auditName,auditInspectionDate,auditResult  From PMHistory WHERE auditSchduleId=$id").then((value){
        for (var i in value){
          setState(() {
            pmHistory.add(PmHistory(
              auditSchduleId: num.parse(i['auditSchduleId'].toString()),
              assetTagId:num.parse(i['assetTagId'].toString()),
              auditName: i['auditName'].toString(),
              auditInspectionDate: i['auditInspectionDate'].toString(),
              auditResult: i['auditResult'].toString()
            ));
          });
        }
      });
    });
  }
  List<PreventiveScheduleData> scheduleDataList=[];
  CompletedScheduleData?completedScheduleData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.assetScheduleData!.isNotEmpty) {
      scheduleDataList = widget.assetScheduleData!;
      loadPmHistoryLocal(widget.assetScheduleData!.first.auditSchduleId);
    }else{
      completedScheduleData = widget.completedScheduleData!.first;
      loadPmHistoryLocal(widget.completedScheduleData!.first.auditSchduleId);
    }
    Future.delayed(const Duration(milliseconds: 0001),() {
      loading = false;
    },);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isDialOpen.value){
          isDialOpen.value = false;
          return false;
        }else if(isDialOpenR.value){
          isDialOpenR.value = false;
          return false;
        }
        return true;
      },
      child:
      Scaffold(
        appBar:Appbar().getAppbar(context, "Asset Details"),
        body: scheduleDataList.isNotEmpty?
        ListView(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(left:20,right: 10 ),
                  height: 100,
                  width: MediaQuery.of(context).size.width*0.2,
                  child: Center(
                    child: CachedNetworkImage(
                      placeholder: (context, url) => const Image(image: AssetImage('assets/placeholder.png')),
                      imageUrl: scheduleDataList.first.image=='noimg.png'?
                      '${scheduleDataList.first.assetImage}':'${DataManager.getInstance().getFileUrl()}${scheduleDataList.first.image}',
                      errorWidget: (context, url, error) => const Image(image: AssetImage('assets/placeholder.png')),
                    ),
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30,),
                      Text("${scheduleDataList.first.auditName}",style: pricolortext,),
                      const SizedBox(height: 15,),
                      const Text("Ready to deploy",style: redtext,),
                      const SizedBox(height: 15,),
                      Text("${scheduleDataList.first.assetTag}",style: greytext,),
                      const SizedBox(height: 30,),
                    ],
                  ),
                ),
              ],),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
              child: Table(
                columnWidths: const <int, TableColumnWidth>{
                  0: FixedColumnWidth(150),
                  1:FixedColumnWidth(10)
                },
                children:[
                  TableRow(
                      decoration: const BoxDecoration(color:Color(0xFFF8F5F5))
                      ,children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10.0,top: 10,left: 5),
                      child: Text("Company Name",style: title,),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10.0,top: 10),
                      child: Text(":",style: greytext,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0,top: 10),
                      child: Text("${scheduleDataList.first.companyName}",style: listHeading,),
                    )
                  ]),
                  TableRow(children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10.0,top: 10,left: 5),
                      child: Text("Category",style: title,),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10.0,top: 10),
                      child: Text(":",style: greytext,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0,top: 10),
                      child: Text("${scheduleDataList.first.categoryName}",style: bluetext,),
                    )
                  ]),
                  TableRow(
                      decoration: const BoxDecoration(color:Color(0xFFF8F5F5)),
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10.0,top: 10,left: 5),
                          child: Text("Model No.",style: title,),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10.0,top: 10),
                          child: Text(":",style: greytext,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0,top: 10),
                          child: Text("${scheduleDataList.first.modelName}",style: listHeading,),
                        )
                      ]),
                  TableRow(children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10.0,top: 10,left: 5),
                      child: Text("Purchase Date",style: title,),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10.0,top: 10),
                      child: Text(":",style: greytext,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0,top: 10),
                      child: Text("${scheduleDataList.first.purchaseDate}",style: listHeading,),
                    )
                  ]),
                  TableRow(
                      decoration: const BoxDecoration(color:Color(0xFFF8F5F5)),
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10.0,top: 10,left: 5),
                          child: Text("Supplier",style: title,),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10.0,top: 10),
                          child: Text(":",style: greytext,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0,top: 10),
                          child: Text("${scheduleDataList.first.supplierName}",style: bluetext,),
                        )
                      ]),
                  TableRow(children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10.0,top: 10,left: 5),
                      child: Text("Warranty",style: title),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10.0,top: 10),
                      child: Text(":",style: greytext),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0,top: 10),
                      child: Text("${scheduleDataList.first.warrantyMonths} Months",style: listHeading),
                    )
                  ]),
                  TableRow(
                      decoration: const BoxDecoration(color:Color(0xFFF8F5F5)),
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10.0,top: 10,left: 5),
                          child: Text("Location",style: title),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10.0,top: 10),
                          child: Text(":",style: greytext),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0,top: 10),
                          child: Text("${scheduleDataList.first.location}",style: listHeading),
                        )
                      ]),
                ],

              ),
            ),
          ],
        ):
        ListView(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(left:20,right: 10 ),
                  height: 100,
                  width: MediaQuery.of(context).size.width*0.2,
                  child: Center(
                    child: CachedNetworkImage(
                      placeholder: (context, url) => const Image(image: AssetImage('assets/placeholder.png')),
                      imageUrl: completedScheduleData!.image=='noimg.png'?
                        '${completedScheduleData!.assetImage}':'${DataManager.getInstance().getFileUrl()}${completedScheduleData!.image}',
                      errorWidget: (context, url, error) => const Image(image: AssetImage('assets/placeholder.png')),
                    ),
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30,),
                      Text("${completedScheduleData!.auditName}",style: pricolortext,),
                      const SizedBox(height: 15,),
                      const Text("Ready to deploy",style: redtext,),
                      const SizedBox(height: 15,),
                      Text("${completedScheduleData!.assetTag}",style: greytext,),
                      const SizedBox(height: 30,),
                    ],
                  ),
                ),
              ],),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
              child: Table(
                columnWidths: const <int, TableColumnWidth>{
                  0: FixedColumnWidth(150),
                  1:FixedColumnWidth(10)
                },
                children:[
                  TableRow(
                      decoration: const BoxDecoration(color:Color(0xFFF8F5F5))
                      ,children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10.0,top: 10,left: 5),
                      child: Text("Company Name",style: title,),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10.0,top: 10),
                      child: Text(":",style: greytext,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0,top: 10),
                      child: Text("${completedScheduleData!.companyName}",style: listHeading,),
                    )
                  ]),
                  TableRow(children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10.0,top: 10,left: 5),
                      child: Text("Category",style: title,),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10.0,top: 10),
                      child: Text(":",style: greytext,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0,top: 10),
                      child: Text("${completedScheduleData!.categoryName}",style: bluetext,),
                    )
                  ]),
                  TableRow(
                      decoration: const BoxDecoration(color:Color(0xFFF8F5F5)),
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10.0,top: 10,left: 5),
                          child: Text("Model No.",style: title,),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10.0,top: 10),
                          child: Text(":",style: greytext,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0,top: 10),
                          child: Text("${completedScheduleData!.modelName}",style: listHeading,),
                        )
                      ]),
                  TableRow(children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10.0,top: 10,left: 5),
                      child: Text("Purchase Date",style: title,),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10.0,top: 10),
                      child: Text(":",style: greytext,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0,top: 10),
                      child: Text("${completedScheduleData!.purchaseDate}",style: listHeading,),
                    )
                  ]),
                  TableRow(
                      decoration: const BoxDecoration(color:Color(0xFFF8F5F5)),
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10.0,top: 10,left: 5),
                          child: Text("Supplier",style: title,),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10.0,top: 10),
                          child: Text(":",style: greytext,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0,top: 10),
                          child: Text("${completedScheduleData!.supplierName}",style: bluetext,),
                        )
                      ]),
                  TableRow(children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10.0,top: 10,left: 5),
                      child: Text("Warranty",style: title),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10.0,top: 10),
                      child: Text(":",style: greytext),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0,top: 10),
                      child: Text("${completedScheduleData!.warrantyMonths} Months",style: listHeading),
                    )
                  ]),
                  TableRow(
                      decoration: const BoxDecoration(color:Color(0xFFF8F5F5)),
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10.0,top: 10,left: 5),
                          child: Text("Location",style: title),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10.0,top: 10),
                          child: Text(":",style: greytext),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0,top: 10),
                          child: Text("${completedScheduleData!.location}",style: listHeading),
                        )
                      ]),
                ],

              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 100.0),
              child: Center(child: Text("No Inspection Due",style: pricolortext,)),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 30,),
              SpeedDial(
                // animatedIcon: AnimatedIcons.menu_close,
                // animatedIconTheme: IconThemeData(size: 22.0),
                // / This is ignored if animatedIcon is non null
                // child: Text("open"),
                // activeChild: Text("close"),
                icon: Icons.menu,
                activeIcon: Icons.close,
                spacing: 3,
                backgroundColor: primarycolor,
                foregroundColor: white,
                openCloseDial: isDialOpen,
                childPadding: const EdgeInsets.all(5),
                spaceBetweenChildren: 4,
                dialRoot:customDialRoot?(ctx, open, toggleChildren) {
                  return ElevatedButton(
                    onPressed: toggleChildren,
                    style: ElevatedButton.styleFrom(
                      primary: primarycolor,
                      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
                    ),
                    child: const Text("Custom Dial Root", style: TextStyle(fontSize: 17),),
                  );
                }:null,
                buttonSize: buttonSize,
                label: extend ? const Text("Open") : null,
                activeLabel: extend ? const Text("Close") : null,
                childrenButtonSize: childrenButtonSize,
                visible: visible,
                direction: speedDialDirection,
                switchLabelPosition: switchLabelPosition,
                /// If true user is forced to close dial manually
                closeManually: closeManually,
                /// If false, backgroundOverlay will not be rendered.
                renderOverlay: renderOverlay,
                onOpen: () => debugPrint('OPENING DIAL'),
                onClose: () => debugPrint('DIAL CLOSED'),
                useRotationAnimation: useRAnimation,
                tooltip: 'Open Speed Dial',
                heroTag: 'speed-dial-hero-tag',
                // foregroundColor: Colors.black,
                // backgroundColor: Colors.white,
                // activeForegroundColor: Colors.red,
                // activeBackgroundColor: Colors.blue,
                elevation: 8.0,
                animationCurve: Curves.fastLinearToSlowEaseIn,
                isOpenOnStart: false,
                animationDuration: const Duration(milliseconds: 0000),
                shape: customDialRoot
                    ? const RoundedRectangleBorder()
                    : const StadiumBorder(),
                // childMargin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                children: [
                  SpeedDialChild(
                    child:const Icon(Icons.shopping_bag),
                    backgroundColor: primarycolor,
                    foregroundColor: white,
                    label: 'Inspection Logs',
                    labelBackgroundColor: black,
                    labelStyle: const TextStyle(fontSize: 12,color: white,fontWeight: FontWeight.w300),
                    onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),),
                              elevation: 15,
                              child: ListView(
                                shrinkWrap: true,
                                physics: const ScrollPhysics(),
                                padding: const EdgeInsets.all(10),
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        left: 15.0, top: 10),
                                    child: Text(
                                      "Previous Inspection ", style: greytext,),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height * 0.35,
                                    child: ListView.builder(
                                      itemCount: pmHistory.length,
                                      physics: const ScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        var data = pmHistory[index];
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 0),
                                          child: Row(children: [
                                            const Icon(Icons.settings_rounded,
                                              color: primarycolor, size: 48,),
                                            Flexible(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Text("${data.auditName}",
                                                    style: bluetext,
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                  ),
                                                  const SizedBox(height: 3,),
                                                  Row(children: [
                                                    const Text(" Date ",
                                                      style: redtext,),
                                                    Text("${data
                                                        .auditInspectionDate}",
                                                      style: greysubtext,)
                                                  ],),
                                                  const SizedBox(height: 3,),
                                                  Row(children: [
                                                    const Text(" Status ",
                                                      style: redtext,),
                                                    Text("${data.auditResult}",
                                                      style: greysubtext,)
                                                  ],),
                                                  const Divider(height: 1,
                                                    color: grey_400,),
                                                ],
                                              ),
                                            ),
                                          ],),
                                        );
                                      },),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    onLongPress: () {},
                  ),
                  SpeedDialChild(
                    child: const Icon(Icons.check_box_outline_blank),
                    backgroundColor: primarycolor,
                    foregroundColor: white,
                    labelBackgroundColor: black,
                    labelStyle: const TextStyle(fontSize: 12,color: white,fontWeight: FontWeight.w300),
                    label: 'Consumables',
                    onTap: () => setState(() =>null),
                    onLongPress: () => debugPrint('FIRST CHILD LONG PRESS'),
                  ),
                  SpeedDialChild(
                    child: const Icon(Icons.insert_drive_file_sharp),
                    backgroundColor: primarycolor,
                    foregroundColor: white,
                    label: 'Files',
                    labelBackgroundColor: black,
                    labelStyle: const TextStyle(fontSize: 12,color: white,fontWeight: FontWeight.w300),
                    onTap: () => setState(() =>null),
                    onLongPress: () => debugPrint('FIRST CHILD LONG PRESS'),
                  ),
                  SpeedDialChild(
                    child:const Icon(Icons.location_on),
                    backgroundColor: primarycolor,
                    foregroundColor: white,
                    label: 'Location History',
                    labelBackgroundColor: black,
                    labelStyle: const TextStyle(fontSize: 12,color: white,fontWeight: FontWeight.w300),
                    onTap: () => setState(() => null),
                    onLongPress: () => debugPrint('FIRST CHILD LONG PRESS'),
                  ),
                  SpeedDialChild(
                    child:const Icon(Icons.attach_money_outlined),
                    backgroundColor: primarycolor,
                    foregroundColor: white,
                    label: 'Ownership Cost',
                    labelBackgroundColor: black,
                    labelStyle: const TextStyle(fontSize: 12,color: white,fontWeight: FontWeight.w300),
                    onTap: () => setState(() => null),
                    onLongPress: () => debugPrint('FIRST CHILD LONG PRESS'),
                  ),
                ],
              ),
              const Spacer(),
              SpeedDial(
                // animatedIcon: AnimatedIcons.menu_close,
                // animatedIconTheme: IconThemeData(size: 22.0),
                // / This is ignored if animatedIcon is non null
                // child: Text("open"),
                // activeChild: Text("close"),
                icon: Icons.add,
                backgroundColor: primarycolor,
                foregroundColor: white,
                activeIcon: Icons.close,
                spacing: 3,
                openCloseDial: isDialOpenR,
                childPadding: const EdgeInsets.all(5),
                spaceBetweenChildren: 4,
                dialRoot: customDialRoot ? (ctx, open, toggleChildren) {
                  return ElevatedButton(
                    onPressed: toggleChildren,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primarycolor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 18),
                    ),
                    child: const Text(
                      "Custom Dial Root",
                      style: TextStyle(fontSize: 17),
                    ),
                  );
                }: null,
                buttonSize: buttonSize,
                label: extend ? const Text("Open") : null,
                activeLabel: extend ? const Text("Close") : null,
                childrenButtonSize: childrenButtonSize,
                visible: visible,
                direction: speedDialDirection,
                switchLabelPosition: switchLabelPositionR,
                closeManually: closeManually,
                renderOverlay: renderOverlay,
                onOpen: () => debugPrint('OPENING DIAL'),
                onClose: () => debugPrint('DIAL CLOSED'),
                useRotationAnimation: useRAnimation,
                tooltip: 'Open Speed Dial',
                heroTag: 'speed-dial-hero-tag',
                // foregroundColor: Colors.black,
                // backgroundColor: Colors.white,
                // activeForegroundColor: Colors.red,
                // activeBackgroundColor: Colors.blue,
                elevation: 8.0,
                animationCurve: Curves.fastLinearToSlowEaseIn,
                isOpenOnStart: false,
                animationDuration: const Duration(milliseconds: 0000),
                shape: customDialRoot
                    ? const RoundedRectangleBorder()
                    : const StadiumBorder(),
                // childMargin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                children: [
                  SpeedDialChild(
                    child: const Icon(Icons.report),
                    backgroundColor: primarycolor,
                    foregroundColor: white,
                    label: 'Report Problem',
                    labelBackgroundColor: black,
                    labelStyle: const TextStyle(fontSize: 12,color: white,fontWeight: FontWeight.w300),
                    onTap: () => setState(() {}),
                    onLongPress: () => debugPrint('FIRST CHILD LONG PRESS'),
                  ),
                  SpeedDialChild(
                    child:const Icon(Icons.construction),
                    backgroundColor: primarycolor,
                    foregroundColor: white,
                    labelBackgroundColor: black,
                    labelStyle: const TextStyle(fontSize: 12,color: white,fontWeight: FontWeight.w300),
                    label: 'Start Inspection',
                    onTap: (){
                      if(scheduleDataList.isNotEmpty) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),),
                                elevation: 15,
                                child: ListView(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 5.0),
                                  shrinkWrap: true,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          left: 15.0, bottom: 10),
                                      child: Text(
                                        "Select Schedule ", style: title,),
                                    ),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics: const ScrollPhysics(),

                                      itemCount: scheduleDataList.length,
                                      itemBuilder: (context, index) {
                                        var scheduleData = scheduleDataList[index];
                                        return Container(
                                          decoration: const BoxDecoration(
                                            border: Border(bottom: BorderSide(
                                                color: grey_400)),
                                          ),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        InspectionFirstStep(auditScheduleId: scheduleData.auditSchduleId),));
                                            },
                                            child: Row(
                                              children: [
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 5),
                                                  padding: EdgeInsets.zero,
                                                  height: 100,
                                                  width: 80,
                                                  child: Center(
                                                    child: CachedNetworkImage(
                                                      placeholder: (context,
                                                          url) =>
                                                      const Image(
                                                          image: AssetImage(
                                                              'assets/placeholder.png')),
                                                      imageUrl: scheduleData.image=='noimg.png'?
                                                      '${scheduleData.assetImage}':'${DataManager.getInstance().getFileUrl()}${scheduleData.image}', errorWidget: (context,
                                                          url, error) =>
                                                      const Image(
                                                          image: AssetImage(
                                                              'assets/placeholder.png')),
                                                    ),
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets
                                                            .only(left: 5.0),
                                                        child: Text(
                                                          "${scheduleData
                                                              .auditName}",
                                                          style: priColorTextSmall,),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 5.0),
                                                        child: Text("${scheduleData.assetTag}",style: greytext,),
                                                      ),
                                                      Row(
                                                        children: [
                                                          const Icon(
                                                            Icons.location_on,
                                                            size: 20,
                                                            color: grey_400,),
                                                          scheduleData
                                                              .location != null
                                                              ?
                                                          Flexible(
                                                            child: Text(
                                                              " Location - ${scheduleData
                                                                  .location}",
                                                              style: greysubtext,),
                                                          )
                                                              :
                                                          const SizedBox(),
                                                        ],),
                                                      Row(children: [
                                                        const Icon(
                                                          Icons.access_time,
                                                          size: 20,
                                                          color: grey_400,),
                                                        scheduleData.auditStatus == "Pending"?
                                                        const Text("Due",style: redtext,):Text(capitalize(" ${scheduleData.auditStatus}"),style: redtext,),
                                                        scheduleData.auditStartDate != null?
                                                        Flexible(child: Text(" ${DateFormat("dd-MM-yyyy hh:mm aa").format(DateTime.parse(scheduleData.auditStartDate.toString()))}",style: greysubtext,)):
                                                        const SizedBox(),

                                                      ],),
                                                      scheduleData.escalatedAuditLevels!.isNotEmpty ?
                                                      Row(children: [
                                                        const Icon(
                                                          Icons.show_chart,
                                                          size: 20,
                                                          color: grey_400,),
                                                        const Text(
                                                          " Escalation ",
                                                          style: redtext,),

                                                        Text(" L${scheduleData
                                                            .escalatedAuditLevels} ",
                                                          style: greysubtext,) ,
                                                      ],):
                                                      const SizedBox(),
                                                    ],
                                                  ),
                                                ),
                                              ],),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                )
                            );
                          },
                        );
                      }
                    },
                  ),
                  SpeedDialChild(
                    child: const Icon(Icons.login),
                    backgroundColor: primarycolor,
                    foregroundColor: white,
                    label: 'Transferable',
                    labelBackgroundColor: black,
                    labelStyle: const TextStyle(fontSize: 12,color: white,fontWeight: FontWeight.w300),
                    onTap: () {
                        if (scheduleDataList.first.canCheckin == 0 &&
                            scheduleDataList.first.canCheckout == 0) {
                          Loading().showToast(
                              msg: 'Asset is not ready to deploy');
                        } else if (scheduleDataList.first.canCheckin == 1 &&
                            scheduleDataList.first.canCheckout == 0) {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>
                                AssetCheckIn(
                                    scheduleData: scheduleDataList.first),));
                        } else if (scheduleDataList.first.canCheckin == 0 &&
                            scheduleDataList.first.canCheckout == 1) {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>
                                AssetCheckOut(
                                    scheduleData: scheduleDataList.first),));
                        }
                    }
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
extension EnumExt on FloatingActionButtonLocation {
  /// Get Value of The SpeedDialDirection Enum like Up, Down, etc. in String format
  String get value => toString().split(".")[1];
}
