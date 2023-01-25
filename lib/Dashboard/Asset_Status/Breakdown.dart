import 'package:adani/Utils/Styles.dart';
import 'package:adani/controllar/Apis.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'Operational_Asset_Deatils_Screen.dart';
import 'package:adani/Dashboard/db/sqlite_service.dart';
import 'package:adani/Utils/constants.dart';
import 'package:adani/controllar/data_manager.dart';
import 'package:adani/models/AssetsStatus.dart';

class BreakdownAsset extends StatefulWidget {
  const BreakdownAsset({Key? key}) : super(key: key);

  @override
  State<BreakdownAsset> createState() => _BreakdownAssetState();
}

class _BreakdownAssetState extends State<BreakdownAsset> {
  List<AllUserAssetAssgainData>assetsList=[];
  String noDataFound='';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadAssetsLocal();
  }

  loadAssetsLocal(){
    Loading().onLoading();
    assetsList.clear();
    dbHelper().getDb()!.then((value) {
      value.rawQuery("SELECT * From AssetStatus WHERE assetStatus=0 AND companyId=${DataManager.getInstance().getCompanyId()}").then((value) {
        for (var i in value){
          setState(() {
            assetsList.add(AllUserAssetAssgainData(
                id : num.parse(i['id'].toString()),
                name: i['name'].toString(),
                companyId: num.parse(i['companyId'].toString()),
                userId: num.parse(i['userId'].toString()),
                image: i['image'].toString(),
                modelName: i['modelName'].toString(),
                assetTag: i['assetTag'].toString(),
                location: i['location'].toString(),
                lastAuditDate: i['lastAuditDate'].toString(),
                companyName: i['companyName'].toString(),
                categoryName: i['categoryName'].toString(),
                purchaseDate: i['purchaseDate'].toString(),
                supplierName: i['supplierName'].toString(),
                warrantyMonths: num.parse(i['warrantyMonths'].toString()),
                status: i['status'].toString(),
                assetStatus: num.parse(i['assetStatus'].toString())
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
    return RefreshIndicator(
      color: primarycolor,
      strokeWidth: 3.5,
      onRefresh: (){
        return Future.delayed(const Duration(seconds: 3),(){
          if(DataManager.getInstance().getConnection()){
            Api().getAssetStatusList().then((value) => loadAssetsLocal());
          }else{
            loadAssetsLocal();
          }
        });
      },
      child: assetsList.isNotEmpty?
      ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: assetsList.length,
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context,int index) {
          var data=assetsList[index];
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Operational_asset_details(assetData: data),));
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
                    width: 60,
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
                        Text("${data.name}",style: pricolortext,),
                        const SizedBox(height: 5,),
                        Text("${data.modelName} - ${data.assetTag}",style: greytext,),

                        Row(children: [
                          const Icon(Icons.location_on,size: 20,color: grey_400,),
                          Text(" Location - ${data.location}",style: greysubtext,)
                        ],),
                        Row(children: [
                          const Icon(Icons.access_time,size: 20,color: grey_400,),
                          const Text(" Last Inspection Date ",style: greysubtext,),
                          Text(" ${data.lastAuditDate}",style: greysubtext,)
                        ],),
                      ],
                    ),
                  ),
                ],),
            ),
          );
        } ,):
      Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height *0),
        child: Center(child: Text(noDataFound,style: dataNotFound,)),
      ),
    );
  }
}
