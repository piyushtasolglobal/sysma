
import 'dart:convert';
import 'package:adani/Dashboard/Consumables_details.dart';
import 'package:adani/Dashboard/db/sqlite_service.dart';
import 'package:adani/Utils/constants.dart';
import 'package:adani/controllar/Apis.dart';
import 'package:adani/controllar/data_manager.dart';
import 'package:adani/models/Consumables.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../Utils/App_bar.dart';
import '../Utils/Styles.dart';

class Consumables extends StatefulWidget {
  const Consumables({Key? key}) : super(key: key);

  @override
  State<Consumables> createState() => _ConsumablesState();
}

class _ConsumablesState extends State<Consumables> {
  List<ConsumablesData> consumablesList = [];
  List<ConsumablesData> filterConsumablesList = [];
  String noDataFound='';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadConsumablesLocal();
  }

  filterConsumables(value){
    setState(() {
      filterConsumablesList = consumablesList.where((x) => x.name!.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }

  loadConsumablesLocal(){
    Loading().onLoading();
    consumablesList.clear();
    dbHelper().getDb()!.then((value) {
      value.rawQuery("SELECT * From Consumable").then((value) {
        for (var i in value){
          setState(() {
            consumablesList.add(ConsumablesData(
              id : num.parse(i['cId'].toString()),
              name: i['name'].toString(),
              image: i['image'].toString(),
              category: Category(id:jsonDecode(i['category'].toString())['id'],name: jsonDecode(i['category'].toString())['name'] ),
              orderNumber: i['orderNumber'].toString(),
              location: Location(id:jsonDecode(i['location'].toString())['id'],name: jsonDecode(i['location'].toString())['name']),
              minAmt: num.parse(i['minQty'].toString()),
              qty: num.parse(i['qty'].toString()),
              remaining: num.parse(i['avlQty'].toString())
            ));
          });
        }
        setState(() {
          filterConsumablesList = consumablesList;
          noDataFound='No Data Available!';
        });
        Loading().onDone();
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar().getAppbar(context, "Consumables"),
      body: RefreshIndicator(
        color: primarycolor,
        strokeWidth: 3.5,
        onRefresh: (){
          return Future.delayed(const Duration(seconds: 3),(){
            if(DataManager.getInstance().getConnection()){
              Api().getConsumablesList().then((value) => loadConsumablesLocal());
            }else{
              loadConsumablesLocal();
            }
          });
        },
        child: ListView(
          children: [
            Container(
              height: 40,
              margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
              width: MediaQuery.of(context).size.width ,
              decoration: const BoxDecoration(
                color: white,
                borderRadius: BorderRadius.all(Radius.circular(2)),
              ),
              child: TextFormField(
                  onChanged: (value) =>filterConsumables(value),
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
                    hintText: 'Search consumables',
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
            filterConsumablesList.isNotEmpty?
            ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              itemCount: filterConsumablesList.length,
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context,index) {
                var data = filterConsumablesList[index];
                return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  ConsumableDetail(consumablesId: data.id.toString()),));
                    },
                    child:  Container(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(color: grey_400),),
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            height: 50,
                            width: 100,
                            child: Center(
                              child: CachedNetworkImage(
                                placeholder: (context, url) => const Image(image: AssetImage('assets/placeholder.png')),
                                imageUrl: '${DataManager.getInstance().getFileUrl()}${data.image}',
                                errorWidget: (context, url, error) => const Image(image: AssetImage('assets/placeholder.png')),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10,),
                                Row(children: [
                                  const Text("Name:",style: pricolortext,overflow: TextOverflow.ellipsis,),
                                  Text(" ${data.name}",style: pricolortext,)
                                ],),
                                const SizedBox(height: 3,),
                                Row(children: [
                                  const Text("Category:",style: greysubtext,),
                                  Text(" ${data.category!.name}",style: greysubtext,)
                                ],),
                                const SizedBox(height: 3,),
                                Row(children: [
                                  const Text("Order No:",style: greysubtext,),
                                  Text(" ${data.orderNumber}",style: greysubtext,)
                                ],),
                                const SizedBox(height: 3,),
                                Row(children: [
                                  const Text("Location:",style: greysubtext,),
                                  Text(" ${data.location!.name}",style: greysubtext,)
                                ],),
                                const SizedBox(height: 3,),
                                Row(children: [
                                  const Text("Min. QTY:",style: greysubtext,),
                                  Text(" ${data.minAmt}",style: greysubtext,)
                                ],),
                                const SizedBox(height: 3,),
                                Row(children: [
                                  const Text("Remain Quantity:",style: greysubtext,),
                                  Text(" ${data.qty}",style: greysubtext,)
                                ],),


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
