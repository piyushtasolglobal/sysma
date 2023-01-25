import 'package:adani/Utils/App_bar.dart';
import 'package:flutter/material.dart';

import '../Utils/Styles.dart';
import '../Utils/constants.dart';
import 'package:adani/controllar/Apis.dart';
import '../models/ConsumableLogsModel.dart';
import '../models/ConsumableUserModel.dart';
import 'Consumable_logs_list.dart';
import 'Consumable_user_List.dart';
class ConsumableDetail extends StatefulWidget {
  var consumablesId;
   ConsumableDetail({Key? key,this.consumablesId}) : super(key: key);

  @override
  State<ConsumableDetail> createState() => _ConsumableDetailState();
}

class _ConsumableDetailState extends State<ConsumableDetail> {
  @override
  List<ConsumableUserData> consumableuser =[];
  List<ConsumableLogsData> consumablelogs =[];
  var userCount = 0;
  var logsCount = 0;

  void initState() {
    // TODO: implement initState
    super.initState();
    loadConsumableUser();
    loadConsumableLogs();
  }

  loadConsumableUser(){
    Loading().onLoading();
    Api().getConsumableDetailsUser(consumablesId: widget.consumablesId).then((value){
      setState(() {
        consumableuser = value.rows!;
        userCount = value.totalCount!.toInt();
      });
      Loading().onDone();
    });
  }

  loadConsumableLogs(){
    Loading().onLoading();
    Api().getConsumableDetailsLogs(consumablesId: widget.consumablesId).then((value){
      setState(() {
        consumablelogs = value.rows!;
        logsCount = value.totalCount!.toInt();
      });
      Loading().onDone();
      setState(() {
        noDataFound='No Data Available!';
      });
    });
  }

  String noDataFound = '';
  bool checkin = true;
  bool visible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar().getAppbar(context, "Consumable Detail"),
      body: ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        children: [
          const SizedBox(height: 10,),
          const Text('Flexible conduit reel Consumable', style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800,fontSize: 17,),textAlign: TextAlign.center),
          ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemCount:  consumableuser.length >= 2 ? 2 : consumableuser.length == 1 ? 1 : consumableuser.length,
            itemBuilder: (context, index) {
              var data = consumableuser[index];

              return Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0,top: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('QTY: ${data.qty}',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 17)),
                          Text('${data.createdAt}',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 17)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0,top: 3),
                      child: Text('Type: ${data.assignedType}',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 17)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0,top: 3),
                      child: Text('Checked Out To: ${data.assignedLocation}',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 17)),
                    ),
                    const SizedBox(height: 10,),

                  ],
                ),
              );
            },),

          ElevatedButton(
              onPressed: consumableuser.length > 2 ?(){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ConsumableuserList(consumableId: widget.consumablesId),));
              }:(){
                Loading().onError(msg: "No Other Consumable Found!");
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width,40),
                  primary: const Color(0xFFFFCDD2)
              ),
              child: Text("View All($userCount items)",style: const TextStyle(fontWeight: FontWeight.w500,color: Color(0xFFC62828),fontSize: 18),)),

          const SizedBox(height: 10,),

          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Flexible conduit reel Consumable CheckIn and Restock Log',
                style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800,fontSize: 17),textAlign: TextAlign.center),
          ),

          ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemCount:  consumablelogs.length >= 2 ? 2 : consumablelogs.length == 1 ? 1 : consumablelogs.length,
            itemBuilder: (context, index) {
              var data = consumablelogs[index];
              return Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0,top: 3),
                      child: Text('ETP Area ->  ${data.type}',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 17)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0,top: 3),
                      child: Text('QTY: ${data.qty}',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 17)),
                    ),
                    const SizedBox(height: 10,),

                  ],
                ),
              );
            },),
          ElevatedButton(
              onPressed: consumablelogs.length > 2 ?(){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ConsumablelogsList(consumableId: widget.consumablesId),));
              }:(){
                Loading().onError(msg: "No Other Logs Found!");
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width,40),
                  primary: const Color(0xFFFFCDD2)
              ),
              child: Text("View All($logsCount items)",style: const TextStyle(fontWeight: FontWeight.w500,color:Color(0xFFC62828),fontSize: 18),)),
        ],
      ),
    );
  }
}
