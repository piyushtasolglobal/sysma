
import 'package:adani/controllar/data_manager.dart';
import 'package:adani/models/AssetsStatus.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../Utils/App_bar.dart';
import '../../Utils/Styles.dart';

class Operational_asset_details extends StatefulWidget {
  AllUserAssetAssgainData?assetData;
  Operational_asset_details({Key? key, required this.assetData}) : super(key: key);

  @override
  State<Operational_asset_details> createState() => _Operational_asset_detailsState();
}

class _Operational_asset_detailsState extends State<Operational_asset_details> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:Appbar().getAppbar(context, "Asset Details"),
      body: ListView(children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(left:20,right: 10 ),
              height: 100,
              width: MediaQuery.of(context).size.width*0.2,
              child: Center(
                child: CachedNetworkImage(
                  placeholder: (context, url) => const Image(image: AssetImage('assets/placeholder.png')),
                  imageUrl: '${DataManager.getInstance().getFileUrl()}${widget.assetData!.image}',
                  errorWidget: (context, url, error) => const Image(image: AssetImage('assets/placeholder.png')),
                ),
              ),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30,),
                  Text("${widget.assetData!.name}",style: pricolortext,),
                  const SizedBox(height: 15,),
                  Text("${widget.assetData!.status}",style: bredtext,),
                  const SizedBox(height: 15,),
                  Text("${widget.assetData!.assetTag}",style: greytext,),
                  const SizedBox(height: 30,),
                ],
              ),
            ),
          ],),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 5),
          child: Table(
            columnWidths: const <int, TableColumnWidth>{
              0: FixedColumnWidth(150),
              1:FixedColumnWidth(10)
            },
            children:[
              TableRow(
                  decoration: const BoxDecoration(color:Color(0xFFF8F5F5))
                  ,children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 10.0,top: 10,left: 5),
                  child: Text("Company Name",style: greytext,),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 10.0,top: 10),
                  child: Text(":",style: greytext,),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0,top: 10),
                  child: Text("${widget.assetData!.companyName}",style: title,),
                )
              ]),
              TableRow(children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 10.0,top: 10,left: 5),
                  child: Text("Category",style: greytext,),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 10.0,top: 10),
                  child: Text(":",style: greytext,),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0,top: 10),
                  child: Text("${widget.assetData!.categoryName}",style: bluetext,),
                )
              ]),
              TableRow(
                  decoration: const BoxDecoration(color:Color(0xFFF8F5F5)),
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10.0,top: 10,left: 5),
                      child: Text("Model No.",style: greytext,),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10.0,top: 10),
                      child: Text(":",style: greytext,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0,top: 10),
                      child: Text("${widget.assetData!.modelName}",style: title,),
                    )
                  ]),
              TableRow(children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 10.0,top: 10,left: 5),
                  child: Text("Purchase Date",style: greytext,),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 10.0,top: 10),
                  child: Text(":",style: greytext,),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0,top: 10),
                  child: Text("${widget.assetData!.purchaseDate}",style: title,),
                )
              ]),
              TableRow(
                  decoration: const BoxDecoration(color:Color(0xFFF8F5F5)),
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10.0,top: 10,left: 5),
                      child: Text("Supplier",style: greytext,),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10.0,top: 10),
                      child: Text(":",style: greytext,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0,top: 10),
                      child: Text("${widget.assetData!.supplierName}",style: bluetext,),
                    )
                  ]),
              TableRow(children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 10.0,top: 10,left: 5),
                  child: Text("Warranty",style: greytext),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 10.0,top: 10),
                  child: Text(":",style: greytext),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0,top: 10),
                  child: Text("${widget.assetData!.warrantyMonths} Months",style: title),
                )
              ]),
              TableRow(
                  decoration: const BoxDecoration(color:Color(0xFFF8F5F5)),
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10.0,top: 10,left: 5),
                      child: Text("Location",style: greytext),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10.0,top: 10),
                      child: Text(":",style: greytext),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0,top: 10),
                      child: Text("${widget.assetData!.location}",style: title),
                    )
                  ]),
              TableRow(
                  decoration: const BoxDecoration(color:Color(0xFFF8F5F5)),
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10.0,top: 10,left: 5),
                      child: Text("Status",style: greytext),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10.0,top: 10),
                      child: Text(":",style: greytext),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0,top: 10),
                      child: widget.assetData!.assetStatus == 1?const Text("Operational",style: bluetext):const Text("Breakdown",style: bluetext),
                    )
                  ]),
            ],

          ),
        )
      ],),
    );
  }
}
