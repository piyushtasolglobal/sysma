import 'package:adani/Dashboard/db/sqlite_service.dart';
import 'package:adani/Utils/constants.dart';
import 'package:adani/controllar/Apis.dart';
import 'package:adani/models/Kits.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import '../Utils/App_bar.dart';
import '../Utils/Styles.dart';

class predefined_kits extends StatefulWidget {
  const predefined_kits({Key? key}) : super(key: key);
  @override
  State<predefined_kits> createState() => _predefined_kitsState();
}

class _predefined_kitsState extends State<predefined_kits> {
  List<KitsData> kitsList=[];
  List<KitsData> filterKitsList=[];
  String noDataFound ='';
  bool netConn = false;
  loadKitsLocal(){
    Loading().onLoading();
    kitsList.clear();
    dbHelper().getDb()!.then((value) {
      value.rawQuery("SELECT * From Kits").then((value) {
        for (var i in value){
          setState(() {
            kitsList.add(KitsData(
              id : num.parse(i['kId'].toString()),
              name: i['name'].toString(),
            ));
          });
        }
        setState(() {
          filterKitsList = kitsList;
          noDataFound='No Data Available!';
        });
        Loading().onDone();
      });
    });
  }
  filterComponents(value){
    setState(() {
      filterKitsList = kitsList.where((x) => x.name!.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadKitsLocal();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if(result.name == 'wifi' || result.name == 'mobile'){
        netConn=true;
      }else{
        netConn=false;
      }
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar().getAppbar(context, "Predefined Kits"),
      body:RefreshIndicator(
        color: primarycolor,
        strokeWidth: 3.5,
        onRefresh: (){
          return Future.delayed(const Duration(seconds: 3),(){
            if(netConn == true){
              Api().getKitsList().then((value) => loadKitsLocal());
            }else{
              loadKitsLocal();
            }
          });
        },
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
              height: 40,
              width: MediaQuery.of(context).size.width ,
              decoration: const BoxDecoration(
                color: white,
                borderRadius: BorderRadius.all(Radius.circular(2)),
              ),
              child: TextFormField(
                  onChanged: (value) => filterComponents(value),
                  textAlignVertical: TextAlignVertical.center,
                  style: title,
                  decoration:  InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: grey, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: grey, width: 1.0),
                    ),
                    contentPadding: const EdgeInsets.all(15),
                    isDense: true,
                    prefixIconConstraints: const BoxConstraints(
                      maxWidth: 30,
                      maxHeight: 30,
                      minHeight: 30,
                      minWidth: 30,
                    ),
                    hintText: 'Search asset',
                    hintStyle: greysubtext,
                    suffixIcon: const Icon(
                      Icons.search_outlined,
                      color: grey,
                      size: 20,
                    ),
                    border: const OutlineInputBorder(borderSide: BorderSide.none),
                  ),
              ),
            ),
            filterKitsList.isNotEmpty?
            ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              itemCount: filterKitsList.length,
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context,int index) {
                var data = filterKitsList[index];
                return InkWell(
                    // onTap: (){
                    //   // Navigator.push(context, MaterialPageRoute(builder: (context) =>  Asset_image(),));
                    // },
                    child: Card(
                      margin: EdgeInsets.symmetric(horizontal: 0.0,vertical: 5.0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 8.0),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 15.0),
                              child: Icon(Icons.settings,color: Colors.indigo,size: 40,),
                            ),
                            Flexible(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("${data.name}",style: pricolortext,),
                                  ElevatedButton(
                                    onPressed: (){},
                                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFff5e32),),
                                    child: const Text("Check Out",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white,fontSize: 14),),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  );
              } ,):
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.4),
              child: Center(child: Text(noDataFound,style: dataNotFound,)),
            ),
          ],),
      ),
    );
  }
}
