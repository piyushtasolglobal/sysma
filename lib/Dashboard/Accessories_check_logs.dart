import 'package:flutter/material.dart';

import '../Utils/constants.dart';
import '../controllar/Apis.dart';
import '../models/AccessoriesLogs.dart';
class Checkin_Out extends StatefulWidget {
  var Accessoryid;
   Checkin_Out({Key? key,this.Accessoryid}) : super(key: key);

  @override
  State<Checkin_Out> createState() => _Checkin_OutState();
}

class _Checkin_OutState extends State<Checkin_Out> {
  String dropdownvalue = 'CheckOut';
  List<AccessoriesLogsData> accessorydetailslogs =[];

  void initState() {
    // TODO: implement initState
    super.initState();
    loadAccessoriesDetailsCheackout();
  }

  loadAccessoriesDetailsCheackout(){
    Loading().onLoading();
    Api().getAccessoriesDetailsLogs(accessoryId: widget.Accessoryid).then((value){
      setState(() {
        accessorydetailslogs = value.rows!;
      });
      Loading().onDone();
    });
  }

  // List of items in our dropdown menu

  var items = [
    'CheckIn',
    'CheckOut',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.grey[200],
        title: Row(
          children: [
            Text('CheckIn And CheckOut Logs',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 16)),
            Spacer(),
            DropdownButton(
              value: dropdownvalue,
              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down,color:  Color(0xFFff5e32)),
              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items,style:TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 15) ),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: accessorydetailslogs.length,
        itemBuilder: (context, index) {
          var data = accessorydetailslogs[index];
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,top: 8),
                  child: Text('G Floor Production-> ${data.type} -',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 17)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('QTY: ${data.qty}',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 17)),
                      Text('${data.dateTime}',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 17)),
                    ],
                  ),
                ),
              ],
            ),
          );
        },),
    );
  }
}
