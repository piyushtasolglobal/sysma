import 'package:flutter/material.dart';

import '../Utils/App_bar.dart';
import '../Utils/constants.dart';
import '../models/ConsumableUserModel.dart';
import '../controllar/Apis.dart';
class ConsumableuserList extends StatefulWidget {
  var consumableId;
   ConsumableuserList({Key? key,this.consumableId}) : super(key: key);

  @override
  State<ConsumableuserList> createState() => _ConsumableuserListState();
}

class _ConsumableuserListState extends State<ConsumableuserList> {
  List<ConsumableUserData> consumableuser =[];


  void initState() {
    // TODO: implement initState
    super.initState();
    loadConsumableUser();
  }

  loadConsumableUser(){
    Loading().onLoading();
    Api().getConsumableDetailsUser(consumablesId: widget.consumableId).then((value){
      setState(() {
        consumableuser = value.rows!;
      });
      Loading().onDone();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar().getAppbar(context, "Flexible conduit reel Consumable"),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: consumableuser.length,
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
                      Text('QTY: ${data.qty}',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 17)),
                      Text('${data.createdAt}',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 17)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,top: 3),
                  child: Text('Type: ${data.assignedType}',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 17)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,top: 3),
                  child: Text('Checked Out To: ${data.assignedLocation} -',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 17)),
                ),
                SizedBox(height: 10,),

              ],
            ),
          );
        },),
    );
  }
}
