
import 'package:adani/Utils/constants.dart';
import 'package:adani/controllar/Apis.dart';
import 'package:adani/controllar/data_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Dashboard/select_company_screen.dart';
import '../Utils/Styles.dart';

class otpverify extends StatefulWidget {
  var mobile;
  otpverify({Key? key, this.mobile}) : super(key: key);
  @override
  State<otpverify> createState() => _otpverifyState();
}

class _otpverifyState extends State<otpverify> {
  //
  // late Timer _timer;
  // int _start = 5;
  // bool isLoading = false;
  // void startTimer() {
  //   const oneSec = Duration(seconds: 1);
  //   _timer = Timer.periodic(
  //     oneSec,
  //         (Timer timer)
  //     {        if (_start == 0) {
  //       setState(() {
  //         timer.cancel();
  //         isLoading = false;
  //       });
  //     } else {
  //       setState(() {
  //         _start--;
  //       });
  //     }
  //     },
  //   );
  // }
  // @override
  // void initState() {
  //   super.initState();
  //   startTimer();
  // }

  final _formKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarycolor,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.3,),
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width*0.7,
              decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/logo3.jpg"),fit: BoxFit.fill)),
            ),
            const SizedBox(height: 50,),
            const Text("OTP Verification",style: TextStyle(fontSize: 16,color: Colors.black87,fontWeight: FontWeight.w500,),textAlign: TextAlign.center,),
            const SizedBox(height: 20,),
            const Text("Enter the OTP send to",style: TextStyle(fontSize: 14,color: Colors.black87,fontWeight: FontWeight.w300,),textAlign: TextAlign.center,),
            const SizedBox(height: 20,),
            Form(
              key: _formKey,
              child: OtpTextField(
                numberOfFields: 6,
                borderColor: Colors.grey,
                showFieldAsBox: false,
                borderWidth: 4.0,
                onCodeChanged: (String code) {},
                onSubmit: (String verificationCode) {
                  setState(() {
                    otpController.text = verificationCode;
                  });
                },
              ),
            ),
            const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ElevatedButton(
                onPressed:() async {
                  if(DataManager.getInstance().getConnection()){
                  if(_formKey.currentState!.validate()){
                    Loading().onLoading();
                    if (otpController.text=='123456'){
                      Loading().onDone();
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const select_company(),),(route) => false,);
                    // Loading().onLoading();
                    // AuthApi().verifyOtp(phone: widget.mobile,otp: otpController.text.toString());
                    // AuthApi().login(phone: otpController.text).then((value){
                    //
                    //   if(value['api_status']==1){
                    //     Loading().onDone();
                    //     // Navigator.push(context, MaterialPageRoute(builder: (context) => const select_company(),));
                    //   }else{
                    //     Loading().onDone();
                    //     Loading().showToast(msg: value["api_message"]);
                    //     // ScaffoldMessenger.of(context).showSnackBar(
                    //     //   SnackBar(content: Text("${value["api_message"]}")),
                    //     // );
                    //   }
                    // });
                    }else{
                      Loading().onDone();
                      Loading().showToast(msg:"Invalid Otp");
                    }
                  }
                  }else{
                    Loading().onError(msg: "You are offline,\nplease check your internet connection");
                  }
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width, 40),
                  backgroundColor: Colors.black,
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),),
                ),
                child: const Text("Login",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
