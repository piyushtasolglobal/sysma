//
// import 'dart:convert';
// import 'package:adani/Dashboard/db/sqlite_service.dart';
// import 'package:adani/controllar/Apis.dart';
// import 'package:adani/controllar/data_manager.dart';
// import 'package:adani/models/Completed.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../Utils/Styles.dart';
// import 'package:intl/intl.dart';
// import 'inspection_details_screen.dart';
//
// class CompletedScreen extends StatefulWidget {
//   const CompletedScreen({Key? key}) : super(key: key);
//   @override
//   State<CompletedScreen> createState() => _CompletedScreenState();
// }
//
// class _CompletedScreenState extends State<CompletedScreen> {
//   TextEditingController dateController = TextEditingController();
//   TextEditingController dateController1 = TextEditingController();
//   List<CompletedScheduleData> completedScheduleData=[];
//   String noDataFound='';
//   bool isLoad = true;
//   int? tableStatus;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     dateController1.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
//     getStatus();
//   }
//
//   getStatus() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     print("table status");
//     print(prefs.getInt('completeTableStatus'));
//
//     if(prefs.getInt('completeTableStatus') == 0){
//       setState(() {
//         tableStatus = prefs.getInt('completeTableStatus');
//         noDataFound = 'Loading...';
//       });
//       load(dateController1.text);
//     }
//     else if(prefs.getInt('completeTableStatus') == 1){
//       setState(() {
//         tableStatus = prefs.getInt('completeTableStatus');
//         noDataFound = 'No Data Available!';
//       });
//       // loadCompletedLocalSaved(dateController1.text).then((value){
//       //
//       // });
//     }
//     else{
//       if(DataManager.getInstance().getConnection()) {
//         setState(() {
//           noDataFound = 'Loading...';
//         });
//         Api().getCompletedSchedule(
//           date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
//           userId: DataManager.getInstance().getUserId(),
//           domain: DataManager.getInstance().getCompanyDomain(),
//         ).then((value){
//           Future.delayed(const Duration(seconds: 1),(){
//             completedScheduleData.clear();
//             getStatus();
//           },);
//         });
//       }
//       else{
//         setState(() {
//           noDataFound = 'No Data Available!';
//         });
//       }
//     }
//   }
//
//   Future<List<CompletedScheduleData>> load(date) async {
//     completedScheduleData.clear();
//     loadCompletedLocal(date).then((value){
//       setState(() {
//         completedScheduleData = value;
//       });
//       // loadCompletedLocalSaved(dateController1.text);
//     }).timeout(const Duration(seconds: 10),onTimeout: () {
//       setState(() {
//         noDataFound = 'No Data Available!';
//       });
//     },);
//     return completedScheduleData;
//   }
//
//   Future<List<CompletedScheduleData>> loadCompletedLocal(date) async{
//     List<CompletedScheduleData> completedScheduleData1=[];
//     dbHelper().getDb()!.then((dbValue) {
//       dbValue.rawQuery("SELECT * FROM CompletedSchedule WHERE auditInspectionDateF == '$date'").then((value) {
//         for (var i in value) {
//           completedScheduleData1.add(CompletedScheduleData(
//               auditSchduleId: num.parse(i['auditSchduleId'].toString()),
//               assetTagId: num.parse(i['assetTagId'].toString()),
//               auditName: i['auditName'].toString(),
//               auditStatus: i['auditStatus'].toString(),
//               image: i['image'].toString(),
//               modelName: i['modelName'].toString(),
//               assetTag: i['assetTag'].toString(),
//               location: i['location'].toString(),
//               auditEndDate: i['auditEndDate'].toString(),
//               auditInspectionDate:i['auditInspectionDate'].toString(),
//               scheduleExpireDate: i['scheduleExpireDate'].toString(),
//               escalatedAuditLevels: i['escalatedAuditLevels'].toString(),
//               maintenanceType: i['maintenanceType'].toString(),
//               companyName: i['companyName'].toString(),
//               categoryName: i['categoryName'].toString(),
//               purchaseDate: i['purchaseDate'].toString() ?? ' ',
//               lastAuditDate: i['lastAuditDate'].toString(),
//               supplierName: i['supplierName'].toString(),
//               warrantyMonths: num.parse(i['warrantyMonths'].toString()),
//               auditParamsValues: jsonDecode(
//                   i['auditParamsValues'].toString()),
//               auditParamsTransaction: jsonDecode(i['auditParamsTransaction'].toString()),
//               inspectionBy: i['inspectionBy'].toString(),
//               status: num.parse(i['status'].toString()),
//               response: i['response'].toString()
//           ));
//         }
//       });
//     });
//     return completedScheduleData1;
//   }
//
//   // Future<List<CompletedScheduleData>> loadCompletedLocalSaved(date) async{
//   //   dbHelper().getDb()!.then((dbValue) {
//   //     dbValue.rawQuery("SELECT * FROM InspectedSchedule WHERE auditInspectionDateF == '$date' AND userId == '${DataManager.getInstance().getUserId()}'").then((value) {
//   //       for (var i in value) {
//   //         completedScheduleData.add(CompletedScheduleData(
//   //             auditSchduleId: num.parse(i['auditSchduleId'].toString()),
//   //             assetTagId: num.parse(i['assetTagId'].toString()),
//   //             auditName: i['auditName'].toString(),
//   //             auditStatus: i['auditStatus'].toString(),
//   //             image: i['image'].toString(),
//   //             modelName: i['modelName'].toString(),
//   //             assetTag: i['assetTag'].toString(),
//   //             location: i['location'].toString(),
//   //             auditEndDate: i['auditEndDate'].toString(),
//   //             auditInspectionDate:i['auditInspectionDate'].toString(),
//   //             scheduleExpireDate: i['scheduleExpireDate'].toString(),
//   //             escalatedAuditLevels: i['escalatedAuditLevels'].toString(),
//   //             maintenanceType: i['maintenanceType'].toString(),
//   //             companyName: i['companyName'].toString(),
//   //             categoryName: i['categoryName'].toString(),
//   //             purchaseDate: i['purchaseDate'].toString() ?? ' ',
//   //             lastAuditDate: i['lastAuditDate'].toString(),
//   //             supplierName: i['supplierName'].toString(),
//   //             warrantyMonths: num.parse(i['warrantyMonths'].toString()),
//   //             auditParamsValues: jsonDecode(
//   //                 i['auditParamsValues'].toString()),
//   //             auditParamsTransaction: i['auditParamsTransaction'].toString(),
//   //             inspectionBy: i['inspectionBy'].toString(),
//   //             status: num.parse(i['status'].toString()),
//   //             response: i['response'].toString()
//   //         ));
//   //       }
//   //     });
//   //   });
//   //   return completedScheduleData;
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Align(
//             alignment: Alignment.topRight,
//             child: Container(
//               margin: const EdgeInsets.only(right: 8),
//               height: 35,
//               width: 140,
//               decoration: const BoxDecoration(
//                 border: Border(bottom: BorderSide(color: grey_400),),
//               ),
//               child: InkWell(
//                 onTap: () async {
//                   DateTime? pickedDate = await showDatePicker(
//                       context: context,
//                       initialDate: DateTime.now(),
//                       firstDate: DateTime(1900),
//                       lastDate: DateTime(2101));
//                   if (pickedDate != null) {
//                     String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
//                     String formattedDate2 = DateFormat('yyyy-MM-dd').format(pickedDate);
//                     setState((){
//                       dateController1.text = formattedDate2;
//                       dateController.text = formattedDate;
//                       noDataFound='Loading...';
//                     });
//                     load(dateController1.text);
//                     Future.delayed(const Duration(seconds: 1),() {
//                       setState(() {
//                         noDataFound='No Data Available!';
//                       });
//                     },);
//                   } else {
//                     print("Date is not selected");
//                   }
//                 },
//                 child: TextFormField(
//                   controller: dateController,
//                   readOnly: true,
//                   enabled: false,
//                   style: title,
//                   decoration: InputDecoration(
//                     suffixIcon: const Icon(Icons.arrow_drop_down_outlined, size: 24,color: primarycolor,),
//                     suffixIconConstraints: const BoxConstraints(maxWidth:20),
//                     contentPadding: const EdgeInsets.symmetric(vertical: 0,horizontal: 5),
//                     hintText:DateFormat('dd-MM-yyyy').format(DateTime.now()),
//                     hintStyle: title,
//                     enabledBorder: InputBorder.none,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: completedScheduleData.isNotEmpty?
//             FutureBuilder(
//               future:completedScheduleData.isEmpty?load(dateController1.text):null,
//               builder: (context, AsyncSnapshot snapshot) {
//                 return RefreshIndicator(
//                   color: primarycolor,
//                   strokeWidth: 3.5,
//                   onRefresh: (){
//                     return Future.delayed(const Duration(seconds: 3),(){
//                       if(DataManager.getInstance().getConnection()){
//                         Api().getCompletedSchedule(
//                           date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
//                           userId: DataManager.getInstance().getUserId(),
//                           domain: DataManager.getInstance().getCompanyDomain(),
//                         ).then((value) => load(dateController1.text));
//                       }else{
//                         load(dateController1.text);
//                       }
//                     });
//                   },
//                   child:completedScheduleData.isNotEmpty?
//                   ListView.builder(
//                     padding: const EdgeInsets.symmetric(horizontal: 10),
//                     itemCount: completedScheduleData.isNotEmpty?completedScheduleData.length:0,
//                     // physics: const ScrollPhysics(),
//                     shrinkWrap: false,
//                     itemBuilder: (context,index) {
//                       var data = completedScheduleData[index];
//                       return InkWell(
//                         onTap: (){
//                           if(data.status == 2){
//                             showDialog(
//                               context: context,
//                               builder: (context) {
//                                 return Dialog(
//                                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//                                   elevation: 16,
//                                   child: ListView(
//                                     padding: const EdgeInsets.all(10),
//                                     shrinkWrap: true,
//                                     children: <Widget>[
//                                       Center(child: Text("${data.auditName}",style: pricolortext,)),
//                                       const SizedBox(height: 10),
//                                       const Center(child: Text('Error')),
//                                       const SizedBox(height: 10),
//                                       Text(data.response.toString()),
//
//                                     ],
//                                   ),
//                                 );
//                               },
//                             );
//                           }
//                           else {
//                             Navigator.push(context, MaterialPageRoute(
//                               builder: (context) =>
//                                   Inspection_details(scheduleData: data),));
//                           }
//                         },
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(vertical: 5.0),
//                           decoration: const BoxDecoration(
//                             border: Border(bottom: BorderSide(color: grey_400),),
//                           ),
//                           child: Column(
//                             children: [
//                               Row(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Container(
//                                     margin: const EdgeInsets.symmetric(horizontal: 10),
//                                     height: 90,
//                                     width: MediaQuery.of(context).size.width*0.22,
//                                     child: Center(
//                                       child: CachedNetworkImage(
//                                         placeholder: (context, url) => const Image(image: AssetImage('assets/placeholder.png')),
//                                         imageUrl: '${DataManager.getInstance().getFileUrl()}${data.image}',
//                                         errorWidget: (context, url, error) => const Image(image: AssetImage('assets/placeholder.png')),
//                                       ),
//                                     ),
//                                   ),
//                                   Flexible(
//                                     child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Padding(
//                                           padding: const EdgeInsets.only(left: 4.0),
//                                           child: Text("${data.auditName}",style: pricolortext,overflow: TextOverflow.ellipsis,maxLines: 2,),
//                                         ),
//                                         const SizedBox(height: 5,),
//                                         Padding(
//                                           padding: const EdgeInsets.only(left: 5.0),
//                                           child: Text("${data.modelName} - ${data.assetTag}",style: greytext,),
//                                         ),
//                                         Row(children:[
//                                           const Icon(Icons.location_on,size: 17,color: grey_400,),
//                                           data.location != null?Text(" Location : ${data.location}",style: greysubtext,):
//                                           const Text(" Location : ",style: greysubtext,),
//                                         ],),
//                                         Row(children: [
//                                           const Icon(Icons.access_time_filled,size: 17,color: grey_400,),
//                                           const Text("Inspection Date :",style: redtext,),
//                                           data.auditInspectionDate != null?
//                                           Flexible(child: Text(DateFormat('dd-MM-yyyy hh:mm aa').format(DateTime.parse(data.auditInspectionDate.toString())),style: greysubtext,overflow: TextOverflow.ellipsis,maxLines: 2,)):
//                                           const Text(""),
//                                         ],),
//                                         Row(children: [
//                                           const Icon(Icons.person,size: 20,color: grey_400,),
//                                           const Text("Inspected by :",style: redtext,),
//                                           Text(data.inspectionBy.toString(),style: greysubtext,overflow: TextOverflow.ellipsis,),
//                                           const Spacer(),
//                                           data.status == 0?
//                                           const Icon(Icons.done_all,size: 20,color: grey_400,):
//                                           data.status == 1?
//                                           const Icon(Icons.done_all,size: 20,color: primarycolor,):
//                                           const Icon(Icons.info_outline,size: 20,color: Colors.red,),
//                                         ],),
//                                       ],
//                                     ),
//                                   ),
//                                 ],),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ):
//                   Center(child: Text(noDataFound,style: dataNotFound,)),
//                 );
//               },
//             ):
//             Center(child: Text(noDataFound,style: dataNotFound,)),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
// // ListView.builder(
// // padding: const EdgeInsets.symmetric(horizontal: 10),
// // itemCount: completedScheduleData.isNotEmpty?completedScheduleData.length:0,
// // physics: const ScrollPhysics(),
// // shrinkWrap: true,
// // itemBuilder: (context,index) {
// // var data = completedScheduleData[index];
// // return InkWell(
// // onTap: (){
// // Navigator.push(context, MaterialPageRoute(builder: (context) => Inspection_details(scheduleData: data),));
// // },
// // child: Container(
// // padding: const EdgeInsets.symmetric(vertical: 5.0),
// // decoration: const BoxDecoration(
// // border: Border(bottom: BorderSide(color: grey_400),),
// // ),
// // child: Column(
// // children: [
// // Row(
// // crossAxisAlignment: CrossAxisAlignment.center,
// // children: [
// // // Container(
// // //   margin: const EdgeInsets.symmetric(horizontal: 10),
// // //   height: 50,
// // //   width: MediaQuery.of(context).size.width*0.2,
// // //   decoration: BoxDecoration(image: DecorationImage(image:NetworkImage("${DataManager.getInstance().getFileUrl()}${data.image}"))),
// // // ),
// // Container(
// // margin: const EdgeInsets.symmetric(horizontal: 10),
// // height: 90,
// // width: 100,
// // child: Center(
// // child: CachedNetworkImage(
// // placeholder: (context, url) => const Image(image: AssetImage('assets/placeholder.png')),
// // imageUrl: '${DataManager.getInstance().getFileUrl()}${data.image}',
// // errorWidget: (context, url, error) => const Image(image: AssetImage('assets/placeholder.png')),
// // ),
// // ),
// // ),
// // Flexible(
// // child: Column(
// // crossAxisAlignment: CrossAxisAlignment.start,
// // children: [
// // Padding(
// // padding: const EdgeInsets.only(left: 4.0),
// // child: Text("${data.auditName}",style: pricolortext,overflow: TextOverflow.ellipsis,maxLines: 2,),
// // ),
// // const SizedBox(height: 5,),
// // Padding(
// // padding: const EdgeInsets.only(left: 5.0),
// // child: Text("${data.modelName} - ${data.assetTag}",style: greytext,),
// // ),
// // Row(children:[
// // const Icon(Icons.location_on,size: 17,color: grey_400,),
// // data.location != null?Text(" Location : ${data.location}",style: greysubtext,):
// // const Text(" Location : ",style: greysubtext,),
// // ],),
// // Row(children: [
// // const Icon(Icons.access_time_filled,size: 17,color: grey_400,),
// // const Text(" Last Ins. Date :",style: redtext,),
// // data.lastAuditDate != null?
// // Flexible(child: Text(DateFormat('dd-MM-yyyy hh:mm aa').format(DateTime.parse(data.lastAuditDate.toString())),style: greysubtext,overflow: TextOverflow.ellipsis,maxLines: 2,)):
// // Text(""),
// // ],),
// // Row(children: [
// // const Icon(Icons.person,size: 20,color: grey_400,),
// // const Text("Inspected by :",style: redtext,),
// // Text(data.inspectionBy.toString(),style: greysubtext,overflow: TextOverflow.ellipsis,)
// // ],),
// // ],
// // ),
// // ),
// // ],),
// // ],
// // ),
// // ),
// // );
// // } ,)
//
//
//
// // Container(
// // margin: const EdgeInsets.only(right: 8),
// // height: 35,
// // decoration: const BoxDecoration(
// // border: Border(bottom: BorderSide(color: grey_400),),
// // ),
// // child: Row(
// // mainAxisAlignment: MainAxisAlignment.end,
// // crossAxisAlignment: CrossAxisAlignment.end,
// // children: [
// // Card(
// // margin: const EdgeInsets.symmetric(horizontal: 5),
// // elevation: 2,
// // shape: RoundedRectangleBorder(
// // borderRadius: BorderRadius.circular(2.0),
// // ),
// // child: SizedBox(
// // height: 35,
// // // width: MediaQuery.of(context).size.width*0.30,
// // width: 120,
// // child: InkWell(
// // onTap: () async {
// // DateTime? pickedDate = await showDatePicker(
// // context: context,
// // initialDate: DateTime.now(),
// // firstDate: DateTime(1900),
// // lastDate: DateTime(2101));
// // if (pickedDate != null) {
// // String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
// // String formattedDate2 = DateFormat('yyyy-MM-dd').format(pickedDate);
// // // load(formattedDate2);
// // setState(() {
// // isLoad = true;
// // dateController1.text = formattedDate2;
// // dateController.text = formattedDate;
// // completedScheduleData.clear();
// // noDataFound='';
// // });
// //
// // // loadCompleted(date: formattedDate2);
// // // dbHelper().getDb()!.then((value) {
// // //   value.rawDelete("DELETE FROM CompletedSchedule");
// // // });
// // Api().getCompletedSchedule(
// // date: formattedDate2,
// // userId: DataManager.getInstance().getUserId(),
// // domain: DataManager.getInstance().getCompanyDomain(),
// // cid: DataManager.getInstance().getCompanyId(),
// // ).then((value) => load(dateController1.text));
// // } else {
// // print("Date is not selected");
// // }
// // },
// // child: TextFormField(
// // controller: dateController,
// // readOnly: true,
// // enabled: false,
// // style: title,
// // decoration: InputDecoration(
// // suffixIcon: const Icon(Icons.arrow_drop_down_outlined, size: 24,color: primarycolor,),
// // suffixIconConstraints: BoxConstraints(maxWidth:20),
// // contentPadding: const EdgeInsets.symmetric(vertical: 0,horizontal: 5),
// // hintText:DateFormat('dd-MM-yyyy').format(DateTime.now()),
// // hintStyle: title,
// // enabledBorder: InputBorder.none,
// // ),
// // ),
// // ),
// // ),
// // ),
// // ],
// // ),
// // )