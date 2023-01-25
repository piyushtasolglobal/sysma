import 'package:adani/Utils/App_bar.dart';
import 'package:flutter/material.dart';

import '../Utils/constants.dart';
import '../controllar/Apis.dart';
import '../models/AccessoryUser.dart';
class AccessoryList extends StatefulWidget {
  var Accessoryid;
   AccessoryList({Key? key,this.Accessoryid}) : super(key: key);

  @override
  State<AccessoryList> createState() => _AccessoryListState();
}

class _AccessoryListState extends State<AccessoryList> {
  @override
  List<AccessoryUserData> accessorydetails =[];

  void initState() {
    // TODO: implement initState
    super.initState();
    loadAccessoriesDetailsList();
    // loadAccessoriesDetailscheackout();
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar().getAppbar(context, "Accessory List"),
      
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        itemCount: accessorydetails.length,
        itemBuilder: (context, index) {
          var data = accessorydetails[index];
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
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8),
                  child: ElevatedButton(
                      onPressed: (){},
                      child: const Text("Check In",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white,fontSize: 18),),
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(MediaQuery.of(context).size.width,35),
                          primary: const Color(0xFFff5e32)
                      )),
                ),
                const SizedBox(height: 10,),
              ],
            ),
          );
        },),
    );
  }
}
