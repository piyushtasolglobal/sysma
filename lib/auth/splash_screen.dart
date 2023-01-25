import 'dart:async';

import 'package:adani/Dashboard/dashboard_screen.dart';
import 'package:adani/auth/sign_in.dart';
import 'package:adani/controllar/data_manager.dart';
import 'package:flutter/material.dart';
import 'package:adani/auth/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Utils/Styles.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  
  @override
  void initState(){
    super.initState();
    getValidate();
  }

  getValidate()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getString("companyId");
    if(id == null || id == ""){
      Timer(const Duration (seconds: 2),()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const login(),)));
      // Timer(const Duration (seconds: 2),()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignInScreen(),)));
    }else{
      DataManager.getInstance().setFileUrl(prefs.getString('fileUrl'));
      DataManager.getInstance().setInspectedFileUrl(prefs.getString('inspectedFileUrl'));
      DataManager.getInstance().setAudioUrl(prefs.getString('audioUrl'));
      DataManager.getInstance().setCompanyDomain(prefs.getString('companyDomain'));
      DataManager.getInstance().setCompanyToken(prefs.getString('companyToken'));
      DataManager.getInstance().setCompanyId(prefs.getString('companyId'));
      DataManager.getInstance().setCompanyName(prefs.getString('companyName'));
      DataManager.getInstance().setUserId(prefs.getString('userId'));
      DataManager.getInstance().setPhone(prefs.getString('phone'));
      DataManager.getInstance().setUserName(prefs.getString('userName'));
      Timer(const Duration (seconds: 2),()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard(index: 0),)));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:primarycolor,
      body: Padding(
        padding: const EdgeInsets.only(top: 300.0,bottom: 50),
        child: Column(
          children: [
            Image.asset("assets/logoMain.jpg"),
            // const Spacer(),
            // const Text("Powered By",style: wlistsubHeading,),
            // Image.asset("assets/sublogo1.png")
          ],
        ),
      ),
    );
  }
}
