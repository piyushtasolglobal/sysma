
import 'dart:convert';
import 'package:adani/Dashboard/Licenses_details.dart';
import 'package:adani/Dashboard/db/sqlite_service.dart';
import 'package:adani/Utils/constants.dart';
import 'package:adani/controllar/Apis.dart';
import 'package:adani/controllar/data_manager.dart';
import 'package:adani/models/Licenses.dart';
import 'package:flutter/material.dart';
import '../Utils/App_bar.dart';
import '../Utils/Styles.dart';

class Licenses extends StatefulWidget {
  const Licenses({Key? key}) : super(key: key);

  @override
  State<Licenses> createState() => _LicensesState();
}

class _LicensesState extends State<Licenses> {
  List<LicensesData> licensesList=[];
  List<LicensesData> filterLicensesList=[];
  String noDataFound='';

  loadLicensesLocal(){
    Loading().onLoading();
    licensesList.clear();
    dbHelper().getDb()!.then((value) {
      value.rawQuery("SELECT * From Licences").then((value) {
        for (var i in value){
          setState(() {
            licensesList.add(LicensesData(
              id : num.parse(i['lId'].toString()),
              name: i['name'].toString(),
              expirationDate: ExpirationDate(date: jsonDecode(i['expDate'].toString())['date'],diffForHuman: jsonDecode(i['expDate'].toString())['diffForHuman'],formatted: jsonDecode(i['expDate'].toString())['formatted']),
              manufacturer: Manufacturer(name: jsonDecode(i['manufacturer'].toString())['name']),
              seats: num.parse(i['seats'].toString()),
              freeSeatsCount: num.parse(i['freeSeatsCount'].toString()),
            ));
          });
        }
        setState(() {
          filterLicensesList = licensesList;
          noDataFound='No Data Available!';
        });
        Loading().onDone();
      });
    });
  }
  filterLicenses(value){
    setState(() {
      filterLicensesList = licensesList.where((x) => x.name!.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadLicensesLocal();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar().getAppbar(context, "Licenses"),
      body: RefreshIndicator(
        color: primarycolor,
        strokeWidth: 3.5,
        onRefresh: (){
          return Future.delayed(const Duration(seconds: 3),(){
            if(DataManager.getInstance().getConnection()){
              Api().getLicencesList().then((value) => loadLicensesLocal());
            }else{
              loadLicensesLocal();
            }
          });
        },
        child: ListView(
          children: [
            Container(
            margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            height: 40,
            width: MediaQuery.of(context).size.width ,
            decoration: const BoxDecoration(
              color: white,
              borderRadius: BorderRadius.all(Radius.circular(2)),
            ),
            child: TextFormField(
                onChanged: (value) => filterLicenses(value),
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
                  hintText: 'Search licenses',
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
            filterLicensesList.isNotEmpty?
            ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              itemCount: filterLicensesList.length,
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context,index) {
                var data = filterLicensesList[index];
                return
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LicensesDetails(licenseData: data),));
                    },
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10,),
                        Row(children: [
                          const Text("Name:",style: pricolortext,),
                          Text("${data.name}",style: pricolortext,)
                        ],),
                        const SizedBox(height: 3,),
                        Row(children: [
                          const Text("Expiration Date:",style: greysubtext,),
                          Text("${data.expirationDate!.formatted}",style: greysubtext,)
                        ],),
                        const SizedBox(height: 3,),
                        Row(children: [
                          const Text("Location:",style: greysubtext,),
                          Text("${data.manufacturer!.name}",style: greysubtext,)
                        ],),
                        const SizedBox(height: 3,),
                        Row(children: [
                          const Text("Total Licenses:",style: greysubtext,),
                          Text("${data.seats}",style: greysubtext,)
                        ],),
                        const SizedBox(height: 3,),
                        Row(children: [
                          const Text("Remaining Licenses:",style: greysubtext,),
                          Text("${data.freeSeatsCount}",style: greysubtext,)
                        ],),
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
