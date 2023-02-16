import 'package:adani/Utils/Styles.dart';
import 'package:adani/controllar/data_manager.dart';
import 'package:adani/models/Breakdown.dart';
import 'package:flutter/material.dart';

import '../controllar/Apis.dart';

class breakdown extends StatefulWidget {
  const breakdown({Key? key}) : super(key: key);
  @override
  State<breakdown> createState() => _breakdownState();
}

class _breakdownState extends State<breakdown> {
  List<BreakdownScheduleData> breakdownScheduleData=[];
  String noDataFound='';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 1),() {
      setState(() {
       // loadBreakdown();
        noDataFound='No Data Available!';
      });
    });
  }

   loadBreakdown(){
     Api().getBreakdownSchedule(/*userId: DataManager.getInstance().getUserId(),domain: DataManager.getInstance().getCompanyDomain()*/).then((value){
       setState(() {
         breakdownScheduleData = value.totalAssetScheduledata!;
       });
       setState(() {
         noDataFound='No Data Available!';
       });
     });
   }

  @override
  Widget build(BuildContext context) {
    return
      breakdownScheduleData.isNotEmpty?
    ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemCount: breakdownScheduleData.isNotEmpty?breakdownScheduleData.length:0,
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context,index) {
        var data = breakdownScheduleData[index];
        return InkWell(
          onTap: (){
            // Navigator.push(context, MaterialPageRoute(builder: (context) =>  const Asset_image(),));
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: grey_400),),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(image: DecorationImage(image:NetworkImage("${DataManager.getInstance().getFileUrl()}${data.image}"))),),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${data.auditName}",style: pricolortext,overflow: TextOverflow.ellipsis,),
                      Text("${data.name}",style: greytext,overflow: TextOverflow.ellipsis,),
                      Row(children: [
                        const Icon(Icons.location_on,size: 20,color: grey_400,),
                        Text("${data.location}",style: greysubtext,)
                      ],),
                      Row(children: [
                        const Icon(Icons.access_time,size: 20,color: grey_400,),
                        const Text(" Overdue ",style: redtext,),
                        Text(" ${data.lastAuditDate} ",style: greysubtext,)
                      ],),
                      Row(children: const [
                        Icon(Icons.show_chart,size: 20,color: grey_400,),
                        Text(" Escalation ",style: redtext,),
                        Text(" L1 ",style: greysubtext,)
                      ],),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ):
    Center(child: Text(noDataFound,style: dataNotFound,));
  }
}


