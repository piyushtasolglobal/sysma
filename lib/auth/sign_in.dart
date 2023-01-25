
import 'package:adani/Dashboard/select_company_screen.dart';
import 'package:adani/Utils/constants.dart';
import 'package:adani/controllar/Apis.dart';
import 'package:adani/controllar/data_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Utils/Styles.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController mobileNumberController = TextEditingController();

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
              decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/logo3.jpg"),fit: BoxFit.fill)),),
            const SizedBox(height: 50,),
            const Text("Phone Number",style: TextStyle(fontSize: 18,color: Colors.black87,fontWeight: FontWeight.w400,),textAlign: TextAlign.center,),
            const SizedBox(height: 20,),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: mobileNumberController,
                  // maxLength: 10,
                  style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.black87),
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Enter Phone Number',
                    prefixIcon: Text("+91",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.black87),),
                    contentPadding: EdgeInsets.symmetric(horizontal: 25),
                    errorStyle: TextStyle(color: Colors.white),
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter phone number';
                    }
                    return null;
                  },
                ),
              ),
            ),

            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ElevatedButton(
                onPressed:(){
                  if(DataManager.getInstance().getConnection()) {
                    if (_formKey.currentState!.validate()) {
                      Loading().onLoading();
                      Api().login(phone: mobileNumberController.text).then((
                          value) async {
                        if (value['api_status'] == 1) {
                          FirebaseAuth auth = FirebaseAuth.instance;
                          await auth.verifyPhoneNumber(
                            phoneNumber: '+91-${mobileNumberController.text}',
                            verificationCompleted: (PhoneAuthCredential credential) async {
                              await auth.signInWithCredential(credential);
                              print(credential.smsCode);
                              print("otp sent");
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              if (value['data']['first_name'] != null &&
                                  value['data']['last_name'] != null) {
                                prefs.setString("userName",
                                    value['data']['first_name'] +
                                        value['data']['last_name']);
                                DataManager.getInstance().setUserName(
                                    value['data']['first_name'] +
                                        value['data']['last_name']);
                              } else if (value['data']['first_name'] != null &&
                                  value['data']['last_name'] == null) {
                                prefs.setString(
                                    "userName", value['data']['first_name']);
                                DataManager.getInstance().setUserName(
                                    value['data']['first_name']);
                              } else if (value['data']['first_name'] == null &&
                                  value['data']['last_name'] != null) {
                                prefs.setString(
                                    "userName", value['data']['last_name']);
                                DataManager.getInstance().setUserName(
                                    value['data']['last_name']);
                              } else {
                                prefs.setString("userName", " ");
                                DataManager.getInstance().setUserName(" ");
                              }
                              prefs.setString("phone", value['data']['phone']);
                              DataManager.getInstance().setPhone(
                                  value['data']['phone']);
                              // sendOtp();
                              Loading().onDone();
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) =>
                                    otpverify(
                                        mobile: mobileNumberController.text),));
                            },
                            verificationFailed: (FirebaseAuthException e) {
                              print(e.code);
                              if (e.code == 'invalid-phone-number') {
                                Loading().onError(msg: "phone number is not valid");
                                print('The provided phone number is not valid.');
                              }else{
                                print(e);
                                print(e.message);
                              }
                            },
                            codeAutoRetrievalTimeout: (verificationId) {},
                            timeout: const Duration(seconds: 60),
                            codeSent: (String verificationId, int? forceResendingToken) async {
                              // // Update the UI - wait for the user to enter the SMS code
                              // String smsCode = '1234';
                              // // Create a PhoneAuthCredential with the code
                              // PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
                              // // Sign the user in (or link) with the credential
                              // await auth.signInWithCredential(credential);
                            },
                          );
                        } else {
                          Loading().onDone();
                          Loading().showToast(msg: value["api_message"]);
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   SnackBar(content: Text("${value["api_message"]}")),
                          // );
                        }
                      });
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
                child: const Text("Generate OTP",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class otpverify extends StatefulWidget {
  var mobile;
  otpverify({Key? key, this.mobile}) : super(key: key);
  @override
  State<otpverify> createState() => _otpverifyState();
}

class _otpverifyState extends State<otpverify> {

  final _formKey2 = GlobalKey<FormState>();
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
              key: _formKey2,
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
                  if(_formKey2.currentState!.validate()){
                      Loading().onLoading();
                      if (otpController.text=='123456'){
                        Loading().onDone();
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const select_company(),),(route) => false,);
                      }else{
                        Loading().onDone();
                        Loading().showToast(msg:"Invalid Otp");
                      }
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
