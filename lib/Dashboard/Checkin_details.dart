import 'package:adani/Dashboard/Accesory_list.dart';
import 'package:adani/Dashboard/Accessories_check_logs.dart';
import 'package:adani/Utils/Styles.dart';
import 'package:adani/Utils/constants.dart';
import 'package:adani/controllar/Apis.dart';
import 'package:flutter/material.dart';

import '../Utils/App_bar.dart';
import '../models/AccessoriesLogs.dart';
import '../models/AccessoryUser.dart';
class Check_in extends StatefulWidget {
  var Accessoryid;
   Check_in({Key? key,this.Accessoryid}) : super(key: key);

  @override
  State<Check_in> createState() => _Check_inState();
}

class _Check_inState extends State<Check_in> {

  List<AccessoryUserData> accessorydetails =[];
  List<AccessoriesLogsData> accessorydetailslogs =[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadAccessoriesDetailsList();
    loadAccessoriesDetailsLogs();
  }

  loadAccessoriesDetailsList(){
    Loading().onLoading();
    Api().getAccessoriesDetailsList(accessoryId: widget.Accessoryid).then((value){
      setState(() {
        accessorydetails = value.rows!;
      });
      Loading().onDone();
    });
  }

  loadAccessoriesDetailsLogs(){
    Loading().onLoading();
    Api().getAccessoriesDetailsLogs(accessoryId: widget.Accessoryid).then((value){
      setState(() {
        accessorydetailslogs = value.rows!;
      });
      Loading().onDone();
      setState(() {
        noDataFound='No Data Available!';
      });
    });
  }

  String noDataFound = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar().getAppbar(context, "Details"),
      body: accessorydetails.isNotEmpty || accessorydetailslogs.isNotEmpty ?
      ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: accessorydetails.length >= 2 ? 2 : accessorydetails.length == 1 ? 1 : accessorydetails.length,
            itemBuilder: (context, index) {
              var data = accessorydetails[index];
               return  Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),
                ),
                color: white,
                child: ListView(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 7,vertical: 10),
                  children: [
                    Row(children: [
                      Text("QTY: ${data.qty}",style: greytext,),
                      const Spacer(),
                      Text("${data.createdAt}",style: greytext,),
                    ],),
                    Text("Type: ${data.assignedType}",style: greytext,),
                    Text("Checked out to: ${data.assignedLocation}",style: greytext,),
                    const SizedBox(height: 3,),
                    Container(
                      height: 30,
                      child: ElevatedButton(
                        onPressed: () {
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingInfo(),));
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(MediaQuery.of(context).size.width, 30),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2)),
                          primary: primarycolor,
                        ),
                        child: const Text('Check In', style: title,),
                      ),
                    ),

                  ],
                ),

              );
            },),
          InkWell(
            onTap:accessorydetails.length > 2? (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => AccessoryList(Accessoryid: widget.Accessoryid.toString()),));
            }:(){
              Loading().onError(msg: "No Other Accessories Found!");
            },
            child: Container(
              color: const Color(0xFFFFCDD2),
              height: 35,width: MediaQuery.of(context).size.height,
              child: const Center(child: Text("View All",style: TextStyle(color:
              Color(0xFFC62828),fontSize: 16,fontWeight: FontWeight.w500),),),
            ),
          ),
          const SizedBox(height: 5,),
          ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: accessorydetailslogs.length >= 2 ? 2 : accessorydetailslogs.length == 1 ? 1 : accessorydetailslogs.length,
            itemBuilder: (context, index) {
              var data = accessorydetailslogs[index];
              return Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),
                ),
                color: white,
                child: ListView(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 7,vertical: 10),
                  children: [
                    Text("uat A-b-> ${data.checkin}",style: greytext,),
                    Row(children: [
                      Text("QTY: ${data.qty}",style: greytext,),
                      const Spacer(),
                      Text("${data.dateTime}",style: greytext,),
                    ],),
                    const SizedBox(height: 5,),
                    Container(
                      height: 30,
                      child: ElevatedButton(
                        onPressed: () {
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingInfo(),));
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(MediaQuery.of(context).size.width, 30),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2)),
                          primary: primarycolor,
                        ),
                        child: const Text('Check In', style: title,),
                      ),
                    ),

                  ],
                ),

              );
            },),
          InkWell(
                     onTap:accessorydetailslogs.length > 2 ?(){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Checkin_Out(Accessoryid: widget.Accessoryid.toString()),));
                         }:(){
                       Loading().onError(msg: "No Other Logs Found!");
                     },
                      child: Container(
                        color: const Color(0xFFFFCDD2),
                        height: 35,width: MediaQuery.of(context).size.height,
                        child: const Center(child: Text("View All",style: TextStyle(color:
                        Color(0xFFC62828),fontSize: 16,fontWeight: FontWeight.w500),),),
                   ),
                ),
        ],
      ):
      Center(child: Text(noDataFound,style: dataNotFound,),)

    );
  }
}
