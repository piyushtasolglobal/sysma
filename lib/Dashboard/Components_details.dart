import 'package:adani/Utils/Styles.dart';
import 'package:adani/Utils/constants.dart';
import 'package:adani/controllar/Apis.dart';
import 'package:adani/models/ComponentsLogs.dart';
import 'package:adani/models/ComponentsUser.dart';
import 'package:flutter/material.dart';

import '../Utils/App_bar.dart';
class ComponentDetails extends StatefulWidget {
  var componentId;
  ComponentDetails({Key? key, required this.componentId}) : super(key: key);

  @override
  State<ComponentDetails> createState() => _ComponentDetailsState();
}

class _ComponentDetailsState extends State<ComponentDetails> {
  List<ComponentsUserData> componentsUserList = [];
  List<ComponentsLogsData> componentsLogsList =[];
  String noDataFound = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadComponentsUserList();
    loadComponentsLogsList();
  }

  loadComponentsUserList(){
    Loading().onLoading();
    Api().getComponentsUser(componentId:widget.componentId).then((value){
      setState(() {
        componentsUserList = value.rows!;
      });
      Loading().onDone();
    });
  }

  loadComponentsLogsList(){
    Loading().onLoading();
    Api().getComponentsLogs(componentId:widget.componentId,).then((value){
      setState(() {
        componentsLogsList = value.rows!;
      });
      Loading().onDone();
      setState(() {
        noDataFound='No Data Available!';
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Appbar().getAppbar(context, "Details"),
        body:componentsUserList.isNotEmpty || componentsLogsList.isNotEmpty?

        ListView(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 8),
          children: [
            ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: componentsUserList.length >= 2 ? 2 : componentsUserList.length == 1 ? 1 : componentsUserList.length,
              itemBuilder: (context, index) {
                var data = componentsUserList[index];
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
                        Text("QTY: ${data.assignedQty}",style: greytext,),
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
              onTap:componentsUserList.length > 2? (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) => AccessoryList(Accessoryid: widget.Accessoryid.toString()),));
              }:(){
                Loading().onError(msg: "No Other Accessories Found!");
              },
              child: Container(
                color: const Color(0xFFFFCDD2),
                height: 35,width: MediaQuery.of(context).size.height,
                child: const Center(child: Text("View All",style: TextStyle(color:
                Color(0xFFC62828),fontSize: 16,fontWeight: FontWeight.w500),),),
              ),
            ) ,

            const SizedBox(height: 5,),
            ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: componentsLogsList.length >= 2 ? 2 : componentsLogsList.length == 1 ? 1 : componentsLogsList.length,
              itemBuilder: (context, index) {
                var data = componentsLogsList[index];
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
              onTap:componentsLogsList.length > 2 ?(){
                // Navigator.push(context, MaterialPageRoute(builder: (context) => Checkin_Out(Accessoryid: widget.Accessoryid.toString()),));
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
