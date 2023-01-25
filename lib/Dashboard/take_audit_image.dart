import 'dart:convert';
import 'dart:io';
import 'package:adani/Dashboard/inspection_preview.dart';
import 'package:adani/Utils/App_bar.dart';
import 'package:adani/Utils/Styles.dart';
import 'package:adani/Utils/constants.dart';
import 'package:adani/models/Preventive.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TakeAuditImage extends StatefulWidget {
  List insList;
  List insIds;
  List insParamTrans;
  PreventiveScheduleData?sdata;
  var psi;
  TakeAuditImage({Key? key, required this.insList,required this.insIds,required this.insParamTrans, this.sdata, this.psi}) : super(key: key);
  @override
  State<TakeAuditImage> createState() => _TakeAuditImageState();
}

class _TakeAuditImageState extends State<TakeAuditImage> {
  XFile? selectedImage;
  String? imagePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar().getAppbar(context, "Take Asset Photo"),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 20),
        children: [
          selectedImage == null?
          const Icon(Icons.camera_alt_outlined,size: 200,color: primarycolor,):
          Image.file(File(selectedImage!.path),height: 300,),
          selectedImage == null?
          Container(
            margin: const EdgeInsets.only(top: 50,left: 20,right: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 55.0),
                backgroundColor: primarycolor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () =>_getImage1(source: ImageSource.camera),
              child: const Text("Take Picture",style: buttontextstyle),
            ),
          ):
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 10),
                    backgroundColor: primarycolor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () =>_getImage1(source: ImageSource.camera),
                  child: Row(
                      children: const [
                        Icon(Icons.camera_alt,size: 20,),
                        SizedBox(width: 5,),
                        Text("Retake",style: buttontextstyle),
                      ]
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 35.0,vertical: 10),
                    backgroundColor: primarycolor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => InspectionPreview(insList:widget.insList,insIds:widget.insIds,insParamTrans:widget.insParamTrans,sdata: widget.sdata,psi: widget.psi,assetPic: selectedImage),)).then((value) =>Loading().onDone());
                  },
                  child: Row(
                      children: const [
                        Icon(Icons.arrow_forward_outlined,size: 20,),
                        SizedBox(width: 5,),
                        Text("Next",style: buttontextstyle),
                      ]
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  _getImage1({source}) async {
    XFile? pickedFile = await ImagePicker().pickImage(source: source,maxHeight: 300,
        maxWidth: 150,
        imageQuality: 50);

    if (pickedFile != null) {
      setState(() {
        selectedImage = pickedFile;
        // imagePath = pickedFile.path;
        File file = File(pickedFile.path);
        String base64Encoded = base64Encode(file.readAsBytesSync());
        widget.insParamTrans[0]['audit_asset_image'] = base64Encoded;
      });
    }
  }
}
