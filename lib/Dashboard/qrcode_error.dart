import 'package:adani/Utils/Styles.dart';
import 'package:flutter/material.dart';

import '../Utils/App_bar.dart';
class QRcode_error extends StatefulWidget {
  const QRcode_error({Key? key}) : super(key: key);

  @override
  State<QRcode_error> createState() => _QRcode_errorState();
}

class _QRcode_errorState extends State<QRcode_error> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar().getAppbar(context, "Scan QR Code"),

      body: Center(child:
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Card(
            elevation: 1,
            color: appbarbgcolor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListView(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 25,vertical: 25),
              children: [
              Text("Error",style: bredtext,textAlign: TextAlign.center,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: SizedBox(
                    width: 250,
                    child: Text("The QR is invalid or has been assigned to another asset. Please Rescan/Scan another QR code.",style: greysubtext,)),
              ),
              ElevatedButton(onPressed: (){
                Navigator.pop(context);
              },
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(MediaQuery.of(context).size.width*0.5, 40),
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
                      primary: Colors.black
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text("Rescan",style: buttontextstyle),

                      Icon(Icons.qr_code_scanner,color: white,size: 15,),
                    ],
                  )),

            ],),
          ),
        ),),
    );
  }
}
