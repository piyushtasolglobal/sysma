
import 'dart:convert';

import 'package:adani/Utils/App_bar.dart';
import 'package:adani/Utils/Styles.dart';
import 'package:adani/Utils/textfield_style.dart';
import 'package:adani/controllar/Apis.dart';
import 'package:adani/models/Preventive.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:adani/Dashboard/db/sqlite_service.dart';
import 'package:adani/Utils/constants.dart';
import 'package:adani/controllar/data_manager.dart';
import 'package:adani/models/AssetsStatus.dart';
import 'package:intl/intl.dart';

class AssetsTransferRequests extends StatefulWidget {
  const AssetsTransferRequests({Key? key}) : super(key: key);

  @override
  State<AssetsTransferRequests> createState() => _AssetsTransferRequestsState();
}

class _AssetsTransferRequestsState extends State<AssetsTransferRequests> {
  List<PreventiveScheduleData>assetsList=[];
  String noDataFound='';
  String todayTime = DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadPreventiveLocal().then((value){
      Future.delayed(Duration(seconds: 1),() {
        setState(() {
          assetsList = value;
        });
      },);
    });
  }

  Future<List<PreventiveScheduleData>> loadPreventiveLocal() async{
    List<PreventiveScheduleData> preventiveScheduleData1=[];
    dbHelper().getDb()!.then((value) {
      value.rawQuery("SELECT * From Schedule WHERE maintenanceType == 'preventive' AND auditStatus != 'completed' OR scheduleExpireDate >= '$todayTime'").then((value) {
        for (var i in value){
          preventiveScheduleData1.add(PreventiveScheduleData(
            // id : num.parse(i['sId'].toString()),
            auditSchduleId: num.parse(i['auditSchduleId'].toString()),
            // companyId: num.parse(i['companyId'].toString()),
            assetTagId:num.parse(i['assetTagId'].toString()),
            // userId: num.parse(i['userId'].toString()),
            auditName: i['auditName'].toString(),
            auditStatus: i['auditStatus'].toString(),
            image: i['image'].toString(),
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
          ));
        }
      });
    });
    return preventiveScheduleData1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar().getAppbar(context, "Asset Requests List"),
      body: RefreshIndicator(
        color: primarycolor,
        strokeWidth: 3.5,
        onRefresh: (){
          return Future.delayed(const Duration(seconds: 3),(){
            // if(DataManager.getInstance().getConnection()){
            //   Api().getAssetStatusList().then((value) => loadAssetsLocal());
            // }else{
            //   loadAssetsLocal();
            // }
          });
        },
        child: assetsList.isNotEmpty?
        ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemCount: assetsList.length,
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context,int index) {
            var data = assetsList[index];
            return InkWell(
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) => Operational_asset_details(assetData: data),));
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 0.0),
                decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: grey_400,width: 0.5),),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          height: 100,
                          width: 80,
                          child: Center(
                            child: CachedNetworkImage(
                              placeholder: (context, url) => const Image(image: AssetImage('assets/placeholder.png')),
                              imageUrl: '${DataManager.getInstance().getFileUrl()}${data.image}',
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
                                child: Text("${data.auditName}",style: pricolortext,textAlign: TextAlign.left,overflow: TextOverflow.ellipsis,maxLines: 2,),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 5.0),
                                child: Text("Requested By - Kishore Patidar",style: listHeading,),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Text("${data.modelName} - ${data.assetTag}",style: greytext,),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 1.0),
                                    child: const Icon(Icons.location_on_outlined,size: 19,color: grey_400,),
                                  ),
                                  Flexible(child: Text("${data.location}",style: greysubtext,))
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5.0),
                                    child: const Icon(Icons.access_time,size: 16,color: grey_400,),
                                  ),
                                  data.auditStatus == "Pending"?
                                  const Text("Due",style: redtext,):Text(capitalize(" ${data.auditStatus}"),style: redtext,),
                                  Text(" ${DateFormat("dd-MM-yyyy hh:mm aa").format(DateTime.parse(data.auditStartDate.toString()))}",style: greysubtext,)
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 1.0),
                                    child: const Icon(Icons.show_chart,size: 16,color: grey_400,),
                                  ),
                                  const Text(" Escalation ",style: redtext,),
                                  data.escalatedAuditLevels!.isNotEmpty || data.escalatedAuditLevels!=''?
                                  Text(" L${data.escalatedAuditLevels} ",style: greysubtext,):const SizedBox()
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 0),
                              backgroundColor: primarycolor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: (){},
                            child: Text("Accept",style: smallbuttontextstyle),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 35.0,vertical: 0),
                              backgroundColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                            },
                            child: Text("Reject",style: smallbuttontextstyle),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } ,):
        Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height *0),
          child: Center(child: Text(noDataFound,style: dataNotFound,)),
        ),
      ),
    );
  }
}
