
import 'dart:convert';
import 'package:adani/Dashboard/db/sqlite_service.dart';
import 'package:adani/Utils/constants.dart';
import 'package:adani/controllar/Apis.dart';
import 'package:adani/controllar/data_manager.dart';
import 'package:adani/models/Accessories.dart';
import 'package:flutter/material.dart';
import '../Utils/App_bar.dart';
import '../Utils/Styles.dart';
import 'Checkin_details.dart';

class Accessories extends StatefulWidget {
  const Accessories({Key? key}) : super(key: key);

  @override
  State<Accessories> createState() => _AccessoriesState();
}

class _AccessoriesState extends State<Accessories> {
  List<AccessoriesData> accessoriesList = [];
  List<AccessoriesData> filterAccessoriesList = [];
  String noDataFound ='';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadAccessoriesLocal();
  }

  loadAccessoriesLocal(){
    Loading().onLoading();
    accessoriesList.clear();
    dbHelper().getDb()!.then((value) {
      value.rawQuery("SELECT * From Accessories").then((value) {
        for (var i in value){
          setState(() {
            accessoriesList.add(AccessoriesData(
              id : num.parse(i['aId'].toString()),
              name: i['name'].toString(),
              category: Category(id:jsonDecode(i['category'].toString())['id'],name: jsonDecode(i['category'].toString())['name']),
              manufacturer: Manufacturer(name: jsonDecode(i['manufacturer'].toString())['name']),
              location:Location(name: jsonDecode(i['location'].toString())['name']),
              minQty: num.parse(i['minQty'].toString())??0,
              remainingQty: num.parse(i['avlQty'].toString()),
              image: i['image']
            ));
          });
        }
        setState(() {
          filterAccessoriesList = accessoriesList;
          noDataFound='No Data Available!';
        });
        Loading().onDone();
      });
    });
  }
  filterAccessories(value){
    setState(() {
      filterAccessoriesList = accessoriesList.where((x) => x.name!.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar().getAppbar(context, "Accessories"),
      body: RefreshIndicator(
        color: primarycolor,
        strokeWidth: 3.5,
        onRefresh: (){
          return Future.delayed(const Duration(seconds: 3),(){
            if(DataManager.getInstance().getConnection()){
              Api().getAccessoriesList().then((value) => loadAccessoriesLocal());
            }else{
              loadAccessoriesLocal();
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
                  onChanged: (value) => filterAccessories(value),
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
            filterAccessoriesList.isNotEmpty?
            ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: filterAccessoriesList.length,
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context,index) {
                var data = filterAccessoriesList[index];
                return
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  Check_in(Accessoryid: data.id.toString()),));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(color: grey_400),),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          data.image != null?
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(image: DecorationImage(image:NetworkImage("${data.image}"))),
                          ):
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            height: 50,
                            width: 100,
                            decoration: const BoxDecoration(image: DecorationImage(image:AssetImage("assets/placeholder.png"))),
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${data.name}",style: pricolortext,overflow: TextOverflow.ellipsis,),
                                const SizedBox(height: 3,),
                                Text(" Category: ${data.category!.name} ",style: greysubtext,),
                                const SizedBox(height: 3,),
                                Row(children: [
                                  const Text(" Manufacture:",style: greysubtext,),
                                  Text("${data.manufacturer!.name}",style: greysubtext,),
                                ],),
                                const SizedBox(height: 3,),
                                Row(children: [
                                  const Icon(Icons.location_on,size: 20,color: grey_400,),
                                  Text(" ${data.location!.name}",style: greysubtext,),
                                ],),
                                Text(" Min. QTY: ${data.minQty} ",style: greysubtext,),
                                const SizedBox(height: 3,),
                                Text(" Avail. QTY: ${data.remainingQty} ",style: greysubtext,),
                              ],
                            ),
                          ),
                        ],
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
