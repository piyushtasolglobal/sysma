import 'package:flutter/material.dart';

import '../Utils/App_bar.dart';
import '../Utils/constants.dart';
import '../controllar/Apis.dart';
import '../models/ConsumableLogsModel.dart';
import '../models/ConsumableUserModel.dart';

class ConsumablelogsList extends StatefulWidget {
  var consumableId;
   ConsumablelogsList({Key? key,this.consumableId}) : super(key: key);

  @override
  State<ConsumablelogsList> createState() => _ConsumablelogsListState();
}

class _ConsumablelogsListState extends State<ConsumablelogsList> {

  List<ConsumableLogsData> consumablelogs =[];


  void initState() {
    // TODO: implement initState
    super.initState();
    loadConsumableLogs();
  }

  loadConsumableLogs(){
    Loading().onLoading();
    Api().getConsumableDetailsLogs(consumablesId: widget.consumableId).then((value){
      setState(() {
        consumablelogs = value.rows!;

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
      appBar: Appbar().getAppbar(context, "Flexible conduit reel Consumable CheckIn and Restock Log"),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: consumablelogs.length,
        itemBuilder: (context, index) {
          var data = consumablelogs[index];
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,top: 3),
                  child: Text('ETP Area -> ${data.type} -',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 17)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,top: 3),
                  child: Text('QTY: ${data.qty}',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 17)),
                ),
                SizedBox(height: 10,),

              ],
            ),
          );
        },),
    );
  }
}
