// import 'dart:convert';
// import 'package:adani/Dashboard/db/sqlite_service.dart';
// import 'package:adani/Utils/Styles.dart';
// import 'package:adani/controllar/Apis.dart';
// import 'package:adani/controllar/data_manager.dart';
// import 'package:adani/models/Preventive.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'asset_image_screen.dart';
//
//
// class preventive extends StatefulWidget {
//   const preventive({Key? key}) : super(key: key);
//   @override
//   State<preventive> createState() => _preventiveState();
// }
//
// class _preventiveState extends State<preventive> {
//   List<PreventiveScheduleData> preventiveScheduleData1=[];
//   List<PreventiveScheduleData> preventiveScheduleData=[];
//   String noDataFound='';
//
//   bool loading = false;
//   String today = DateFormat('yyyy-MM-dd').format(DateTime.now());
//   String todayTime = DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now());
//   @override
//   void initState() {
//     // TODO: implement initState
//     // loadPreventive();
//     super.initState();
//     loading = true;
//   }
//
//   @override
//   void didUpdateWidget(oldWidget) {
//     super.didUpdateWidget(oldWidget);
//   }
//
//   Future<List<PreventiveScheduleData>> loadPreventiveLocal() async{
//     preventiveScheduleData.clear();
//     dbHelper().getDb()!.then((value) {
//       // value.rawQuery("SELECT * From Schedule WHERE maintenanceType == 'preventive' AND companyId=${DataManager.getInstance().getCompanyId()} AND scheduleExpireDate >= '$today'").then((value) {
//       value.rawQuery("SELECT * From Schedule WHERE maintenanceType == 'preventive' AND scheduleExpireDate >= '$today'").then((value) {
//         for (var i in value){
//           setState(() {
//             preventiveScheduleData.add(PreventiveScheduleData(
//               id : num.parse(i['sId'].toString()),
//               auditSchduleId: num.parse(i['auditSchduleId'].toString()),
//               companyId: num.parse(i['companyId'].toString()),
//               assetTagId:num.parse(i['assetTagId'].toString()),
//               userId: num.parse(i['userId'].toString()),
//               auditName: i['auditName'].toString(),
//               auditStatus: i['auditStatus'].toString(),
//               image: i['image'].toString(),
//               modelName: i['modelName'].toString(),
//               assetTag: i['assetTag'].toString(),
//               location: i['location'].toString(),
//               auditEndDate: i['auditEndDate'].toString(),
//               scheduleExpireDate: i['scheduleExpireDate'].toString(),
//               escalatedAuditLevels: i['escalatedAuditLevels'].toString(),
//               maintenanceType: i['maintenanceType'].toString(),
//               companyName: i['companyName'].toString(),
//               categoryName: i['categoryName'].toString(),
//               purchaseDate: i['purchaseDate'].toString(),
//               supplierName: i['supplierName'].toString(),
//               warrantyMonths: num.parse(i['warrantyMonths'].toString()),
//               auditParamsId:num.parse(i['auditParamsId'].toString()),
//               auditParamsValues:jsonDecode(i['auditParamsValues'].toString()),
//             ));
//           });
//         }
//         Future.delayed(const Duration(milliseconds: 0001),() {
//           setState(() {
//             loading=false;
//             noDataFound='Loading...';
//           });
//         },);
//       });
//     });
//     return preventiveScheduleData;
//   }
//
//   // loadPreventive(){
//   //   // for server side load
//   //   Api().getPreventiveSchedule(
//   //     token: DataManager.getInstance().getCompanyToken(),
//   //     userId: DataManager.getInstance().getUserId(),
//   //     domain: DataManager.getInstance().getCompanyDomain(),
//   //     cid:DataManager.getInstance().getCompanyId(),
//   //
//   //   ).then((value){
//   //     if(value.apiStatus == 1) {
//   //       setState(() {
//   //         preventiveScheduleData1 = value.totalAssetScheduledata!;
//   //       });
//   //     }else{
//   //       setState(() {
//   //         preventiveScheduleData1 = [];
//   //       });
//   //     }
//   //     // print(preventiveScheduleData1);
//   //     filterPr();
//   //   });
//   // }
//   // filterPr(){
//   //   if(preventiveScheduleData1.isNotEmpty) {
//   //     for(var s in preventiveScheduleData1){
//   //       if(DateTime.parse(s.scheduleExpireDate!).isAfter(DateTime.parse(today)) ){
//   //         preventiveScheduleData.add(s);
//   //       }
//   //     }
//   //     setState(() {
//   //       // preventiveScheduleData = preventiveScheduleData1.where((x) => x.scheduleExpireDate.toString().contains(today)).toList();
//   //       noDataFound='No Asset Schedule Found';
//   //       loading = false;
//   //     });
//   //   }else{
//   //     setState(() {
//   //       preventiveScheduleData = [];
//   //       noDataFound='No Asset Schedule Found';
//   //       loading = false;
//   //     });
//   //   }
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       // loading == true?
//       // const Center(child: CircularProgressIndicator(color: primarycolor,strokeWidth: 4,)):
//       // preventiveScheduleData.isEmpty?
//       // Center(child: Text(noDataFound,style: dataNotFound,)):
//
//       // ListView.builder(
//       //   padding: const EdgeInsets.symmetric(horizontal: 10),
//       //   itemCount: preventiveScheduleData.length,
//       //   physics: const ScrollPhysics(),
//       //   itemBuilder: (context,index) {
//       //     var data = preventiveScheduleData[index];
//       //     return Column(
//       //       children: [
//       //         InkWell(
//       //           onTap: (){
//       //             Navigator.push(context, MaterialPageRoute(builder: (context) => Asset_image(scheduleData: data),));
//       //           },
//       //           child: Container(
//       //             padding: const EdgeInsets.symmetric(vertical: 5.0),
//       //             decoration: const BoxDecoration(
//       //               border: Border(bottom: BorderSide(color: grey_400),),
//       //             ),
//       //             child: Row(
//       //               crossAxisAlignment: CrossAxisAlignment.center,
//       //               children: [
//       //                 Container(
//       //                   margin: const EdgeInsets.symmetric(horizontal: 10),
//       //                   height: 90,
//       //                   width: 100,
//       //                   child: Center(
//       //                     child: CachedNetworkImage(
//       //                       placeholder: (context, url) => const Image(image: AssetImage('assets/placeholder.png')),
//       //                       imageUrl: '${DataManager.getInstance().getFileUrl()}${data.image}',
//       //                       errorWidget: (context, url, error) => const Image(image: AssetImage('assets/placeholder.png')),
//       //                     ),
//       //                   ),
//       //                 ),
//       //                 Flexible(
//       //                   child: Column(
//       //                     crossAxisAlignment: CrossAxisAlignment.start,
//       //                     children: [
//       //                       Text("${data.auditName}",style: pricolortext,overflow: TextOverflow.ellipsis,maxLines: 2,),
//       //                       Text("${data.modelName} - ${data.assetTag}",style: greytext,),
//       //                       Row(children: [
//       //                         const Icon(Icons.location_on,size: 20,color: grey_400,),
//       //                         Flexible(child: Text("${data.location}",style: greysubtext,))
//       //                       ],),
//       //                       DateTime.parse(data.auditEndDate.toString()).isBefore(DateTime.parse(todayTime))?
//       //                       Row(children: [
//       //                         const Icon(Icons.access_time,size: 20,color: grey_400,),
//       //                         const Text(" Overdue ",style: redtext,),
//       //                         Text(" ${DateFormat("dd-MM-yyyy").format(DateTime.parse(data.auditEndDate.toString()))} ",style: greysubtext,)
//       //                       ],):
//       //                       Row(children: [
//       //                         const Icon(Icons.access_time,size: 20,color: grey_400,),
//       //                         const Text(" Due ",style: redtext,),
//       //                         Text(" ${DateFormat("dd-MM-yyyy").format(DateTime.parse(data.auditEndDate.toString()))} ",style: greysubtext,)
//       //                       ],),
//       //                       Row(children: [
//       //                         const Icon(Icons.show_chart,size: 20,color: grey_400,),
//       //                         const Text(" Escalation ",style: redtext,),
//       //                         Text(" L${data.escalatedAuditLevels} ",style: greysubtext,)
//       //                       ],),
//       //                     ],
//       //                   ),
//       //                 ),
//       //               ],
//       //             ),
//       //           ),
//       //         ),
//       //       ],
//       //     );
//       //   } ,);
//
//       FutureBuilder(
//         future:preventiveScheduleData.isEmpty?Future.delayed(const Duration(seconds: 2),() => loadPreventiveLocal(),):null,
//         builder: (context, AsyncSnapshot snapshot) {
//           // print("=======okkkk=========");
//           // print(snapshot.connectionState.name);
//           // if(snapshot.connectionState.name == 'waiting' || snapshot.connectionState.name == 'none' && preventiveScheduleData.isEmpty){}
//           // else{
//           //   Future.delayed(const Duration(milliseconds: 0001),() {
//           //     setState(() {
//           //       loading=false;
//           //       noDataFound='Loading...';
//           //     });
//           //   },);
//           // }
//           return RefreshIndicator(
//             color: primarycolor,
//             strokeWidth: 3.5,
//             onRefresh: (){
//               return Future.delayed(const Duration(seconds: 3),(){
//                 if(DataManager.getInstance().getConnection()){
//                   Api().getPreventiveSchedule(
//                       userId: DataManager.getInstance().getUserId().toString(),
//                       domain: DataManager.getInstance().getCompanyDomain().toString(),
//                       cid: DataManager.getInstance().getCompanyId().toString()).then((value) => loadPreventiveLocal());
//                 }else{
//                   loadPreventiveLocal();
//                 }
//               });
//             },
//             child:
//             loading == true?
//             const Center(child: CircularProgressIndicator(color: primarycolor,strokeWidth: 4,)):
//             preventiveScheduleData.isNotEmpty?
//             ListView.builder(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               itemCount: snapshot.data!.length,
//               physics: const ScrollPhysics(),
//               itemBuilder: (context,index) {
//                 var data = snapshot.data![index];
//                 return Column(
//                   children: [
//                     InkWell(
//                       onTap: (){
//                         Navigator.push(context, MaterialPageRoute(builder: (context) => Asset_image(scheduleData: data),));
//                       },
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(vertical: 5.0),
//                         decoration: const BoxDecoration(
//                           border: Border(bottom: BorderSide(color: grey_400),),
//                         ),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Container(
//                               margin: const EdgeInsets.symmetric(horizontal: 10),
//                               height: 50,
//                               width: 100,
//                               child: Center(
//                                 child: CachedNetworkImage(
//                                   placeholder: (context, url) => const Image(image: AssetImage('assets/placeholder.png')),
//                                   imageUrl: '${DataManager.getInstance().getFileUrl()}${data.image}',
//                                   errorWidget: (context, url, error) => const Image(image: AssetImage('assets/placeholder.png')),
//                                 ),
//                               ),
//                             ),
//                             Flexible(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text("${data.auditName}",style: pricolortext,overflow: TextOverflow.ellipsis,maxLines: 2,),
//                                   Text("${data.modelName} - ${data.assetTag}",style: greytext,),
//                                   Row(children: [
//                                     const Icon(Icons.location_on,size: 20,color: grey_400,),
//                                     Flexible(child: Text("${data.location}",style: greysubtext,))
//                                   ],),
//                                   DateTime.parse(data.auditEndDate.toString()).isBefore(DateTime.parse(todayTime))?
//                                   Row(children: [
//                                     const Icon(Icons.access_time,size: 20,color: grey_400,),
//                                     const Text(" Overdue ",style: redtext,),
//                                     Text(" ${DateFormat("dd-MM-yyyy").format(DateTime.parse(data.auditEndDate.toString()))} ",style: greysubtext,)
//                                   ],):
//                                   Row(children: [
//                                     const Icon(Icons.access_time,size: 20,color: grey_400,),
//                                     const Text(" Due ",style: redtext,),
//                                     Text(" ${DateFormat("dd-MM-yyyy").format(DateTime.parse(data.auditEndDate.toString()))} ",style: greysubtext,)
//                                   ],),
//                                   Row(children: [
//                                     const Icon(Icons.show_chart,size: 20,color: grey_400,),
//                                     const Text(" Escalation ",style: redtext,),
//                                     Text(" L${data.escalatedAuditLevels} ",style: greysubtext,)
//                                   ],),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 );
//               } ,):
//             Center(child: Text(noDataFound,style: dataNotFound,)),
//           );
//         },
//       );
//
//     //   RefreshIndicator(
//     //   color: primarycolor,
//     //   strokeWidth: 3.5,
//     //   onRefresh: (){
//     //     preventiveScheduleData.clear();
//     //     return Future.delayed(const Duration(seconds: 3),(){
//     //       loadPreventive();
//     //       // print(netConn);
//     //       // if(netConn == true){
//     //       //   Api().getPreventiveSchedule(
//     //       //       userId: DataManager.getInstance().getUserId().toString(),
//     //       //       domain: DataManager.getInstance().getCompanyDomain().toString(),
//     //       //       cid: DataManager.getInstance().getCompanyId().toString()).then((value) => loadPreventiveLocal());
//     //       // }else{
//     //       //   loadPreventiveLocal();
//     //       // }
//     //     });
//     //   },
//     //   child: preventiveScheduleData.isNotEmpty?
//     //   ListView.builder(
//     //     padding: const EdgeInsets.symmetric(horizontal: 10),
//     //     itemCount: preventiveScheduleData.length,
//     //     physics: const ScrollPhysics(),
//     //     itemBuilder: (context,index) {
//     //       var data = preventiveScheduleData[index];
//     //       return Column(
//     //         children: [
//     //           InkWell(
//     //             onTap: (){
//     //               Navigator.push(context, MaterialPageRoute(builder: (context) => Asset_image(scheduleData: data),));
//     //             },
//     //             child: Container(
//     //               padding: const EdgeInsets.symmetric(vertical: 5.0),
//     //               decoration: const BoxDecoration(
//     //                 border: Border(bottom: BorderSide(color: grey_400),),
//     //               ),
//     //               child: Row(
//     //                 crossAxisAlignment: CrossAxisAlignment.center,
//     //                 children: [
//     //                   Container(
//     //                     margin: const EdgeInsets.symmetric(horizontal: 10),
//     //                     height: 50,
//     //                     width: 100,
//     //                     child: Center(
//     //                       child: CachedNetworkImage(
//     //                         placeholder: (context, url) => const Image(image: AssetImage('assets/placeholder.png')),
//     //                         imageUrl: '${DataManager.getInstance().getFileUrl()}${data.image}',
//     //                         errorWidget: (context, url, error) => const Image(image: AssetImage('assets/placeholder.png')),
//     //                       ),
//     //                     ),
//     //                   ),
//     //                   Flexible(
//     //                     child: Column(
//     //                       crossAxisAlignment: CrossAxisAlignment.start,
//     //                       children: [
//     //                         Text("${data.auditName}",style: pricolortext,overflow: TextOverflow.ellipsis,maxLines: 2,),
//     //                         Text("${data.modelName} - ${data.assetTag}",style: greytext,),
//     //                         Row(children: [
//     //                           const Icon(Icons.location_on,size: 20,color: grey_400,),
//     //                           Text("${data.location}",style: greysubtext,)
//     //                         ],),
//     //                         DateTime.parse(data.auditEndDate.toString()).isBefore(DateTime.parse(todayTime))?
//     //                         Row(children: [
//     //                           const Icon(Icons.access_time,size: 20,color: grey_400,),
//     //                           const Text(" Overdue ",style: redtext,),
//     //                           Text(" ${DateFormat("dd-MM-yyyy").format(DateTime.parse(data.auditEndDate.toString()))} ",style: greysubtext,)
//     //                         ],):
//     //                         Row(children: [
//     //                           const Icon(Icons.access_time,size: 20,color: grey_400,),
//     //                           const Text(" Due ",style: redtext,),
//     //                           Text(" ${DateFormat("dd-MM-yyyy").format(DateTime.parse(data.auditEndDate.toString()))} ",style: greysubtext,)
//     //                         ],),
//     //                         Row(children: [
//     //                           const Icon(Icons.show_chart,size: 20,color: grey_400,),
//     //                           const Text(" Escalation ",style: redtext,),
//     //                           Text(" L${data.escalatedAuditLevels} ",style: greysubtext,)
//     //                         ],),
//     //                       ],
//     //                     ),
//     //                   ),
//     //                 ],
//     //               ),
//     //             ),
//     //           ),
//     //         ],
//     //       );
//     //     } ,):
//     //   const Center(child: CircularProgressIndicator(color: primarycolor,strokeWidth: 4,)),
//     // );
//
//   }
//
// }
