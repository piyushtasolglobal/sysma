
import 'package:adani/Utils/Styles.dart';
import 'package:adani/Utils/constants.dart';
import 'package:adani/controllar/Apis.dart';
import 'package:adani/models/Accessories.dart';
import 'package:flutter/material.dart';
import '../Utils/App_bar.dart';
import 'Checkout_screen.dart';

class AccessoriesCheckout extends StatefulWidget {
  const AccessoriesCheckout({Key? key}) : super(key: key);

  @override
  State<AccessoriesCheckout> createState() => _AccessoriesCheckoutState();
}

class _AccessoriesCheckoutState extends State<AccessoriesCheckout> {
  List<AccessoriesData> accessoriesList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadAccessories();
  }

  loadAccessories(){
    Loading().onLoading();
    Api().getAccessoriesList().then((value){
      setState(() {
        accessoriesList = value.rows!;
      });
      Loading().onDone();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar().getAppbar(context, "Accessories"),
      body: accessoriesList.isNotEmpty?
      ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: accessoriesList.length,
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context,index) {
          var data = accessoriesList[index];
          return
            InkWell(
              onTap: (){
               // Navigator.push(context, MaterialPageRoute(builder: (context) =>  Asset_image(),));
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: grey_400),),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Column(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: const [
                    //     Center(
                    //       child: Icon(Icons.settings_rounded,color: primarycolor,size: 84,)
                    //     ),
                    //   ],
                    // ),
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
                          Text(" Category: ${data.category} ",style: greysubtext,),
                          const SizedBox(height: 3,),
                          Row(children: [
                            const Text(" Manufacture:",style: greysubtext,),
                            Text("${data.manufacturer!.name}",style: greysubtext,)
                          ],),
                          const SizedBox(height: 3,),
                          Row(children: [
                            const Icon(Icons.location_on,size: 20,color: grey_400,),
                            Text(" ${data.location!.name}",style: greysubtext,)
                          ],),
                          Text(" Min. QTY: ${data.minQty} ",style: greysubtext,),
                          const SizedBox(height: 3,),
                          Text(" Avail. QTY: ${data.remainingQty} ",style: greysubtext,),
                          const SizedBox(height: 5,),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const check_out(),));
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(MediaQuery.of(context).size.width*0.7, 35),
                              backgroundColor: primarycolor,
                              elevation: 0,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                            ),
                            child: const Text('Check Out', style: wlistTitleHeading,),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
        } ,):
      const Center(child: Text("No Data Available !",style: dataNotFound,)),
    );
  }
}
