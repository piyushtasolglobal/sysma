
import 'package:adani/controllar/data_manager.dart';
import 'package:adani/models/AssetsStatus.dart';
import 'package:adani/models/Licenses.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../Utils/App_bar.dart';
import '../../Utils/Styles.dart';

class LicensesDetails extends StatefulWidget {
  LicensesData?licenseData;
  LicensesDetails({Key? key, required this.licenseData}) : super(key: key);

  @override
  State<LicensesDetails> createState() => _LicensesDetailsState();
}

class _LicensesDetailsState extends State<LicensesDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:Appbar().getAppbar(context, "Licence Details"),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30,),
              Text("${widget.licenseData!.name}",style: pricolortext,),
              const SizedBox(height: 15,),
              Text("Location",style: bredtext,),
              const SizedBox(height: 15,),
            ],
          ),
        ),
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
                  child: Text("Company name",style: title,),
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
                  child: Text("category",style: bluetext,),
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
                      child: Text("model",style: title,),
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
                  child: Text("date",style: title,),
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
                      child: Text("supply",style: bluetext,),
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
                  child: Text("Months",style: title),
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
                      child: Text("location",style: title),
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
                      child: const Text("Breakdown",style: bluetext),
                    )
                  ]),
            ],

          ),
        )
      ],),
    );
  }
}
