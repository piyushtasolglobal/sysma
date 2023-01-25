import 'package:adani/Dashboard/db/sqlite_service.dart';
import 'package:adani/Utils/Styles.dart';
import 'package:adani/Utils/constants.dart';
import 'package:adani/controllar/Apis.dart';
import 'package:adani/controllar/data_manager.dart';
import 'package:adani/controllar/share_prefrence.dart';
import 'package:adani/models/Companies.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Utils/App_bar.dart';
import 'dashboard_screen.dart';

class select_company extends StatefulWidget {
  const select_company({Key? key}) : super(key: key);
  @override
  State<select_company> createState() => _select_companyState();
}

class _select_companyState extends State<select_company> {
  List<CompanyResults> companies=[];
  var selected;
  bool loading = true;
  CompanyResults? selectedCompany;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      print(result.name);
      if(result.name == 'wifi' || result.name == 'mobile'){
        load();
      }
    });
    load();
  }
  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
  }
  load(){
      if (DataManager.getInstance().getConnection()) {
        Api().getCompanyList().then((value) {

          if(value.data!.length == 1)
          {
            setState(() {
              selectedCompany = value.data!.first;
              selected = 0;
            });

            if (DataManager.getInstance().getConnection())
            {
              SharePre.setFileUrl(selectedCompany!.assetImgPath.toString());
              SharePre.setInspectedFileUrl(selectedCompany!.assetInsepctionImgPath.toString());
              SharePre.setAudioUrl(selectedCompany!.auditParamAudioPath.toString());
              SharePre.setCompanyDomain(selectedCompany!.domainName.toString());
              SharePre.setCompanyId(selectedCompany!.companyId.toString());
              SharePre.setCompanyName(selectedCompany!.companyName.toString());
              SharePre.setUserId(selectedCompany!.userId.toString());
              SharePre.setUserName(selectedCompany!.userFullName.toString());
              DataManager.getInstance().setUserName(selectedCompany!.userFullName.toString());
              DataManager.getInstance().setFileUrl(selectedCompany!.assetImgPath);
              DataManager.getInstance().setInspectedFileUrl(selectedCompany!.assetInsepctionImgPath);
              DataManager.getInstance().setAudioUrl(selectedCompany!.auditParamAudioPath);


              DataManager.getInstance().setCompanyDomain(selectedCompany!.domainName);

              DataManager.getInstance().setCompanyId(selectedCompany!.companyId);
              DataManager.getInstance().setCompanyName(selectedCompany!.companyName);
              DataManager.getInstance().setUserId(selectedCompany!.userId);

              SharePre.setCompanyToken(selectedCompany!.bearerToken.toString());
              DataManager.getInstance().setCompanyToken(selectedCompany!.bearerToken);

              // dbHelper().getDb()!.then((value) {
              //   // value.rawDelete("DELETE FROM CompletedSchedule");
              //   value.rawDelete("DELETE FROM Schedule");
              // });

              Future.delayed(const Duration(seconds: 1),() {
                Api().getPreventiveSchedule(
                  token: selectedCompany!.bearerToken.toString(),
                  userId: selectedCompany!.userId.toString(),
                  domain: selectedCompany!.domainName.toString(),
                  cid: selectedCompany!.companyId.toString(),
                );
              },);
              // Api().getCompletedSchedule(
              //   date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
              //   userId: selectedCompany!.userId.toString(),
              //   domain: selectedCompany!.domainName.toString(),
              // );

              Api().getAccessoriesList();
              Api().getConsumablesList();
              Api().getLicencesList();
              Api().getComponentsList();
              Api().getKitsList();
              Api().getCategoryList();
              Api().getAssetStatusList();

              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Dashboard(index: 0,from: 'companyPage'),),(route) => false,);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Check your internet connection")),);
            }
          }else{
            setState(() {
              companies = value.data!;
              loading = false;
            });
          }
        });
      }
      else {
        Loading().onError(msg: "Please check internet connection");
      }
  }

  @override
  Widget build(BuildContext context) {
    return loading == true?
    const Center(child: CircularProgressIndicator(color: primarycolor,strokeWidth: 4,)):
      Scaffold(
      appBar:Appbar().getAppbar(context, "Select Company"),
      body: Column(
        children: [
          Expanded(
            flex: 100,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: companies.isNotEmpty?companies.length:0,
              itemBuilder: (context, index) {
                var data = companies[index];
                return Container(
                  decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: grey_400),)
                  ),
                  child: ListTile(
                    onTap: (){
                      setState(() {
                        selected = index;
                        selectedCompany = data;
                      });
                    },
                    dense: true,
                    title: Text("${data.companyName}",style: listtitle),
                    trailing: Visibility(
                        visible: selected==index,
                        child: const Icon(Icons.done_outline_outlined,color: Colors.black54,size: 24,)),
                  ),
                );
              },
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 20.0),
            child: ElevatedButton(
              onPressed: (){
                if(selectedCompany != null) {
                  print(selectedCompany!.userId);
                  if (DataManager.getInstance().getConnection()) {
                    SharePre.setFileUrl(selectedCompany!.assetImgPath.toString());
                    SharePre.setInspectedFileUrl(selectedCompany!.assetInsepctionImgPath.toString());
                    SharePre.setAudioUrl(selectedCompany!.auditParamAudioPath.toString());
                    SharePre.setCompanyDomain(selectedCompany!.domainName.toString());
                    SharePre.setCompanyId(selectedCompany!.companyId.toString());
                    SharePre.setCompanyName(selectedCompany!.companyName.toString());
                    SharePre.setUserId(selectedCompany!.userId.toString());
                    SharePre.setUserName(selectedCompany!.userFullName.toString());
                    DataManager.getInstance().setUserName(selectedCompany!.userFullName.toString());
                    DataManager.getInstance().setFileUrl(selectedCompany!.assetImgPath);
                    DataManager.getInstance().setInspectedFileUrl(selectedCompany!.assetInsepctionImgPath);
                    DataManager.getInstance().setAudioUrl(selectedCompany!.auditParamAudioPath);


                    DataManager.getInstance().setCompanyDomain(selectedCompany!.domainName);
                    var arr = selectedCompany!.domainName?.split('v1');
                    print(arr);




                    DataManager.getInstance().setCompanyId(selectedCompany!.companyId);
                    DataManager.getInstance().setCompanyName(selectedCompany!.companyName);
                    DataManager.getInstance().setUserId(selectedCompany!.userId);
                    SharePre.setCompanyToken(selectedCompany!.bearerToken.toString());
                    DataManager.getInstance().setCompanyToken(selectedCompany!.bearerToken);

                    // dbHelper().getDb()!.then((value) {
                    //   value.rawDelete("DELETE FROM Schedule");
                    // });
                    // Api().getPreventiveSchedule(
                    //   token: selectedCompany!.bearerToken.toString(),
                    //   userId: selectedCompany!.userId.toString(),
                    //   domain: selectedCompany!.domainName.toString(),
                    //   cid: selectedCompany!.companyId.toString(),
                    // );
                    Api().getAccessoriesList();
                    Api().getConsumablesList();
                    Api().getLicencesList();
                    Api().getComponentsList();
                    Api().getKitsList();
                    Api().getCategoryList();
                    Api().getAssetStatusList();
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Dashboard(index: 0,from: 'companyPage'),),(route) => false,);
                  }
                  else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Check your internet connection")),);
                  }
                }else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please select company")),);
                }
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width, 50),
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),),
                backgroundColor: Colors.black,
              ),
              child: const Text("Proceed",style: buttontextstyle),
            ),
          ),
        ],
      ),
    );
  }
}
