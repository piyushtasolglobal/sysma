
import 'package:adani/Dashboard/Category_models_screen.dart';
import 'package:adani/Dashboard/db/sqlite_service.dart';
import 'package:adani/Utils/constants.dart';
import 'package:adani/controllar/Apis.dart';
import 'package:adani/models/CategoryModels.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import '../Utils/App_bar.dart';
import '../Utils/Styles.dart';

class category_list extends StatefulWidget {
  const category_list({Key? key}) : super(key: key);
  @override
  State<category_list> createState() => _category_listState();
}

class _category_listState extends State<category_list> {
  List<Categorylist> categoryList=[];

  String noDataFound='';
  bool netConn = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadCategoryLocal();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      print(result.name);
      if(result.name == 'wifi' || result.name == 'mobile'){
        netConn=true;
      }else{
        netConn=false;
      }
    });
  }

  loadCategoryLocal(){
    Loading().onLoading();
    categoryList.clear();
    dbHelper().getDb()!.then((value) {
      value.rawQuery("SELECT * From Category").then((value) {
        for (var i in value){
          setState(() {
            categoryList.add(Categorylist(
              catId: num.parse(i['cId'].toString()),
              catName: i['name'].toString()
            ));
          });
        }
        setState(() {
          noDataFound='No Data Available!';
        });
        Loading().onDone();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar().getAppbar(context, "Category List"),
      body: RefreshIndicator(
        color: primarycolor,
        strokeWidth: 3.5,
        onRefresh: (){
          return Future.delayed(const Duration(seconds: 3),(){
            if(netConn == true){
              Api().getCategoryList().then((value) => loadCategoryLocal());
            }else{
              loadCategoryLocal();
            }
          });
        },
        child: categoryList.isNotEmpty?
        ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemCount: categoryList.length,
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context,int index) {
            var data = categoryList[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${data.catName}",style: title,),
                  const Divider(color: Colors.black54,thickness: 1.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        margin: const EdgeInsets.symmetric(horizontal: 0.0,vertical: 5.0),
                        elevation: 2,
                        child: InkWell(
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => categoryModels(catId: data.catId),)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15.0),
                            child: Column(
                              children: const [
                                Icon(Icons.dynamic_feed_sharp,size: 50,color: primarycolor,),
                                Text("Models(0)",style: listHeading,)
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        margin: const EdgeInsets.symmetric(horizontal: 0.0,vertical: 5.0),
                        elevation: 2,
                        child: InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15.0),
                            child: Column(
                              children: const [
                                Icon(Icons.web_asset,size: 50,color: primarycolor,),
                                Text("Assets(0)",style: listHeading,)
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        margin: const EdgeInsets.symmetric(horizontal: 0.0,vertical: 5.0),
                        elevation: 2,
                        child: InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15.0),
                            child: Column(
                              children: const [
                                Icon(Icons.work_outline,size: 50,color: primarycolor,),
                                Text("Work Order(0)",style: listHeading,)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          } ,):
        Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.4),
          child: Center(child: Text(noDataFound,style: dataNotFound,)),
        ),
      ),
    );
  }
}
