
import 'dart:convert';
import 'package:adani/Utils/full_image.dart';
import 'package:adani/controllar/data_manager.dart';
import 'package:adani/models/Completed.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../Utils/App_bar.dart';
import '../Utils/Styles.dart';

class Inspection_details extends StatefulWidget {
  CompletedScheduleData? scheduleData;
  Inspection_details({Key? key, required this.scheduleData,}) : super(key: key);

  @override
  State<Inspection_details> createState() => _Inspection_detailsState();
}

class _Inspection_detailsState extends State<Inspection_details> {

  List<dynamic> assetParameterValue = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    assetParameterValue = widget.scheduleData!.auditParamsTransaction != 'null'?
    jsonDecode(widget.scheduleData!.auditParamsTransaction.toString()):[];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar().getAppbar(context, "Inspection Details"),
      backgroundColor: white,
      body: assetParameterValue.isNotEmpty?
      ListView(
        children:  [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget.scheduleData!.status == 1 && widget.scheduleData!.insFrom == 1?
              InkWell(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FullImageScreen(status: widget.scheduleData!.status!.toInt(),url:"${assetParameterValue.first['audit_asset_image']}",),)),
                child: Container(
                  margin: const EdgeInsets.only(left:0,right: 10 ),
                  height: 120,
                  width: MediaQuery.of(context).size.width*0.3,
                  child: Center(
                    child: CachedNetworkImage(
                      placeholder: (context, url) => const Image(image: AssetImage('assets/placeholder.png')),
                      imageUrl: '${DataManager.getInstance().getInspectedFileUrl()}${assetParameterValue.first['audit_asset_image']}',
                      errorWidget: (context, url, error) => const Image(image: AssetImage('assets/placeholder.png')),
                    ),
                  ),
                ),
              ):
              InkWell(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FullImageScreen(status: /*widget.scheduleData!.status!.toInt()*/0,url:"${assetParameterValue.first['audit_asset_image']}",),)),
                child: Container(
                  margin: const EdgeInsets.only(left:0,right: 10 ),
                  height: 120,
                  width: MediaQuery.of(context).size.width*0.3,
                  child: Center(
                    child: Image.memory(base64Decode(assetParameterValue.first['audit_asset_image']),height: 120,),
                  ),
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30,),
                    Text("${widget.scheduleData!.auditName}",style: pricolortext,),
                    const SizedBox(height: 10,),
                    Text("${widget.scheduleData!.assetTag}",style: greytext,),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:[
                        const Icon(Icons.location_on,size: 20,color: grey_400,),
                        widget.scheduleData!.location != null?Text(" Location : ${widget.scheduleData!.location}",style: greysubtext,):
                        const Text(" Location : ",style: greysubtext,)
                      ],
                    ),
                    const SizedBox(height: 30,),
                  ],
                ),
              ),
            ],),
          ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: assetParameterValue.length,
            itemBuilder: (context, index) {
              var data = assetParameterValue[index];
              return Container(
                padding: const EdgeInsets.only(bottom: 8.0,top: 8.0),
                decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black26,width: 3)),
                ),
                child: Column(
                  children: [
                    Container(
                      color: appbarbgcolor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width:MediaQuery.of(context).size.width/2,
                              child: Text("${data['audit_param_name']}",style: greytext,),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 30,
                              width: MediaQuery.of(context).size.width*0.3,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black26),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text("${data['audit_param_value']}",style: greytext,),
                            ),
                          ],),
                      ),
                    ),
                    // data['inspection_img'] != null?
                    Column(
                      children: [
                        data['inspection_img'] != null?
                        widget.scheduleData!.status == 1 && widget.scheduleData!.insFrom == 1?
                        InkWell(
                          onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (context) => FullImageScreen(status: widget.scheduleData!.status!.toInt(),url: "${data['inspection_img']}",),)),
                          child: Container(
                            margin: const EdgeInsets.only(left:0,right: 0,top: 5,bottom: 5 ),
                            height: 120,
                            width: MediaQuery.of(context).size.width*0.3,
                            child: Center(
                              child: CachedNetworkImage(
                                placeholder: (context, url) => const Image(image: AssetImage('assets/placeholder.png')),
                                imageUrl: "${DataManager.getInstance().getInspectedFileUrl()}${data['inspection_img']}",
                                errorWidget: (context, url, error) => const Image(image: AssetImage('assets/placeholder.png')),
                              ),
                            ),
                          ),
                        ):
                        InkWell(
                          onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (context) => FullImageScreen(status: /*widget.scheduleData!.status!.toInt()*/ 0,url: "${data['inspection_img']}",),)),
                          child: Container(
                            margin: const EdgeInsets.only(left:0,right: 0,top: 5,bottom: 5 ),
                            height: 120,
                            width: MediaQuery.of(context).size.width*0.3,
                            child: Center(
                              child: Image.memory(base64Decode(data['inspection_img']),height: 120,),
                            ),
                          ),
                        ):
                        const SizedBox(),
                        data['inspection_comment'] != ""?
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text("Comment",style: greytext,),
                              SizedBox(
                                width: MediaQuery.of(context).size.width*0.65,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 4.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black26),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  height: 50,
                                  width: MediaQuery.of(context).size.width*0.3,
                                  child: Text("${data['inspection_comment']}",style: greytext,),
                                ),
                              ),
                            ],),
                        ):
                        const SizedBox()
                      ],
                    ),
                        // :
                    // const SizedBox(),
                  ],
                ),
              );
            },
          ),
        ],
      ):
      const Center(child: Text("No Asset Parameters Found")),
    );
  }
}
