
import 'dart:convert';
import 'package:adani/Dashboard/Components_details.dart';
import 'package:adani/Dashboard/db/sqlite_service.dart';
import 'package:adani/Utils/constants.dart';
import 'package:adani/controllar/Apis.dart';
import 'package:adani/controllar/data_manager.dart';
import 'package:adani/models/Components.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../Utils/App_bar.dart';
import '../Utils/Styles.dart';

class Components extends StatefulWidget {
  const Components({Key? key}) : super(key: key);
  @override
  State<Components> createState() => _ComponentsState();
}

class _ComponentsState extends State<Components> {
  List<ComponentData> componentsList=[];
  List<ComponentData> filterComponentsList=[];
  String noDataFound ='';

  loadComponentsLocal(){
    Loading().onLoading();
    componentsList.clear();
    dbHelper().getDb()!.then((value) {
      value.rawQuery("SELECT * From Components").then((value) {
        for (var i in value){
          setState(() {
            componentsList.add(ComponentData(
              id : num.parse(i['cId'].toString()),
              name: i['name'].toString(),
              image: i['image'].toString(),
              location: Location(id:jsonDecode(i['location'].toString())['id'],name: jsonDecode(i['location'].toString())['name'] ),
              minAmt: num.parse(i['minQty'].toString()),
              remaining: num.parse(i['avlQty'].toString()),
            ));
          });
        }
        setState(() {
          filterComponentsList = componentsList;
          noDataFound='No Data Available!';
        });
        Loading().onDone();
      });
    });
  }
  filterComponents(value){
    setState(() {
      filterComponentsList = componentsList.where((x) => x.name!.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadComponentsLocal();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar().getAppbar(context, "Components"),
      body:RefreshIndicator(
        color: primarycolor,
        strokeWidth: 3.5,
        onRefresh: (){
          return Future.delayed(const Duration(seconds: 3),(){
            if(DataManager.getInstance().getConnection()){
              Api().getComponentsList().then((value) => loadComponentsLocal());
            }else{
              loadComponentsLocal();
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
                    hintText: 'Search components',
                    hintStyle: greysubtext,
                    suffixIcon: const Icon(
                      Icons.search_outlined,
                      color: grey,
                      size: 20,
                    ),
                    border: const OutlineInputBorder(borderSide: BorderSide.none),
                  )),
            ),
            filterComponentsList.isNotEmpty?
            ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              itemCount: filterComponentsList.length,
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context,index) {
                var data = filterComponentsList[index];
                return
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  ComponentDetails(componentId: data.id),));
                    },
                    child:  Column(
                      children: [
                        Row(
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10,),
                                Text("${data.name}",style: pricolortext,),
                                const SizedBox(height: 3,),
                                Row(children: [
                                  const Text("Location:",style: greysubtext,),
                                  Text("${data.location!.name}",style: greysubtext,)
                                ],),
                                const SizedBox(height: 3,),
                                Row(children: [
                                  const Text("Min. QTY:",style: greysubtext,),
                                  Text("${data.minAmt}",style: greysubtext,)
                                ],),
                                const SizedBox(height: 3,),
                                Row(children: [
                                  const Text("Avail. QTY:",style: greysubtext,),
                                  Text("${data.remaining}",style: greysubtext,)
                                ],),


                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 5,),
                        const Divider(height: 1,color: grey_400,),
                      ],
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
