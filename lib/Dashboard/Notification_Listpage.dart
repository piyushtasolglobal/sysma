
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
import 'package:package_info_plus/package_info_plus.dart';

class Notification_List extends StatefulWidget {
  String?from;
  int?index;
  //Dashboard_2({Key? key, required this.index, this.from}) : super(key: key);

  @override
  State<Notification_List> createState() => _Notification_ListState();
}

class _Notification_ListState extends State<Notification_List> with SingleTickerProviderStateMixin
{
  final scrollController = ScrollController();
  final controller = Get.put(LoadController());

  late int limit, offset;
  late num total_count;
  String str_total_cnt="";
  String version="";
  late String buildNumber;
  bool isLoadingMore = false;
  late SharedPreferences prefs ;

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  //List<PreventiveScheduleData> preventiveScheduleData=[];
  String noDataFound='';
  String noDataFound1='';
  bool loading = false;
  //String today = DateFormat('yyyy-MM-dd').format(DateTime.now());
  //String todayTime = DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now());

  //TextEditingController dateController = TextEditingController();
  //TextEditingController dateController1 = TextEditingController();
  //List<CompletedScheduleData> completedScheduleData=[];

  DateTime? currentBackPressTime;
  //TabController? _tapController;
  //int? tableStatus;
  List<PreventiveScheduleData> res = [];
  //List<CompletedScheduleData> resComplete = [];

  // Fetching the first 20 posts
  int _offsetdb = 20;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initalizePref();
    scrollController.addListener(_scrollListner);

    //_tapController?.index = widget.index!;
    //dateController1.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
    noDataFound = 'Loading...';
    noDataFound1 = 'Loading...';

    Get.find<LoadController>().load_notification();

  }

  initalizePref() async
  {
    prefs = await SharedPreferences.getInstance();
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

  /*Future<List<CompletedScheduleData>> loadCompletedLocal(date) async{
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
  }*/

  Future <void> _scrollListner() async{
    if(scrollController.position.pixels == scrollController.position.maxScrollExtent)
    {
      //print("call api");
      int? totalCount = prefs.getInt("totalcount");
      if(_offsetdb <= totalCount!)
      {
        /*int rem = totalCount - _offsetdb;
        print("_offsetdb->" +_offsetdb.toString());
        print("total_count->" +totalCount.toString());
        print("rem->" +rem.toString());*/

        /*if(rem > 100)
        {
          //Get.find<LoadController>().load_2(_offsetdb);//after insert all show record
          //_offsetdb = _offsetdb+100;
        }
        else if(rem < 100)
         {
           //Get.find<LoadController>().loadPreventiveLocal_3(_offsetdb, rem);
           //_offsetdb = _offsetdb+100;
         }*/
      }
      else{
        //print("_offsetdb->" +_offsetdb.toString());
        //print("total_count->" +totalCount.toString());
      }

    }
    else{
      //print("don't call api");
    }

  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope
      (
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
          elevation: 1,
          backgroundColor: const Color(0xFFF8F5F5),
          iconTheme: const IconThemeData(color: black),
          title: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text("Notification List",style: appbartitle),
          ),
          titleSpacing: 0,
          actions:[
            /*Get.find<LoadController>().preventiveScheduleData.isEmpty?
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: InkWell(
                onTap:null,
                child:  Icon(Icons.qr_code_scanner,size: 24,color: Colors.grey,),
              ),
            ):*/
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: InkWell(
                onTap:(){ Get.find<LoadController>().preventiveScheduleData.isEmpty?
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text("Please wait while load company list"),
                    behavior: SnackBarBehavior.floating,
                    width: MediaQuery.of(context).size.width*0.8,
                  ),
                ) :Navigator.push(context, MaterialPageRoute(builder: (context) => const QRcodescan(),));},
                child:  const Icon(Icons.qr_code_scanner,size: 24,),
              ),
            ),
          ],
        ),
        backgroundColor: white,
        body: GetBuilder<LoadController>(
            builder: (loadcontroller) {
              return FutureBuilder(
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
                            //loadToLocal();
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
                                          child: Text("${data.auditName?.replaceAll(RegExp('&amp;'), '&')}",style: pricolortext,textAlign: TextAlign.left,overflow: TextOverflow.ellipsis,maxLines: 2,),
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
                                            const Icon(Icons.access_time,size: 18,color: grey_400,),
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
              );
            }
        ),
      ),
    );
  }


}

