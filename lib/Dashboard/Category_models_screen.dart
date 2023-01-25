
import 'package:adani/Dashboard/db/sqlite_service.dart';
import 'package:adani/Utils/constants.dart';
import 'package:adani/controllar/Apis.dart';
import 'package:adani/models/CategoryModels.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import '../Utils/App_bar.dart';
import '../Utils/Styles.dart';

class categoryModels extends StatefulWidget {
  var catId;
  categoryModels({Key? key, required this.catId}) : super(key: key);
  @override
  State<categoryModels> createState() => _categoryModelsState();
}

class _categoryModelsState extends State<categoryModels> {
  List<Modelslist> categoryModelsList=[];
  List<Modelslist> filterCategoryModelsList=[];
  String noDataFound='';
  bool netConn = false;
  loadCategoryModelsLocal(cid){
    Loading().onLoading();
    categoryModelsList.clear();
    dbHelper().getDb()!.then((value) {
      value.rawQuery("SELECT * From CategoryModels WHERE catId=$cid").then((value) {
        for (var i in value){
          setState(() {
            categoryModelsList.add(Modelslist(
                modelId: num.parse(i['cmId'].toString()),
                modelName: i['name'].toString(),
                catId: num.parse(i['catId'].toString()),
                catName: i['catName'].toString()
            ));
          });
        }
        setState(() {
          filterCategoryModelsList = categoryModelsList;
          noDataFound='No Data Available!';
        });
        Loading().onDone();
      });
    });
  }
  filterLicenses(value){
    setState(() {
      filterCategoryModelsList = categoryModelsList.where((x) => x.modelName!.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadCategoryModelsLocal(widget.catId);
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      print(result.name);
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
      appBar: Appbar().getAppbar(context, "Category List"),
      body: RefreshIndicator(
        onRefresh: (){
          return Future.delayed(const Duration(seconds: 3),(){
            if(netConn == true){
              Api().getCategoryList().then((value) => loadCategoryModelsLocal(widget.catId));
            }else{
              loadCategoryModelsLocal(widget.catId);
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
                  onChanged: (value) =>filterLicenses(value),
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
                  )),
            ),
            filterCategoryModelsList.isNotEmpty?
            ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              itemCount: filterCategoryModelsList.length,
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context,int index) {
                var data = filterCategoryModelsList[index];
                return
                  Column(
                    children: [
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(Icons.settings,color: Colors.indigo,size: 64,),
                          const SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${data.modelName}",style: pricolortext,),
                              const SizedBox(height: 3,),
                              Row(
                                children: [
                                  const Text("Category Type: ",style: greysubtext,),
                                  Text("${data.catName}",style: greysubtext,),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      const Divider(height: 0.5,color: grey_400,),
                    ],
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
