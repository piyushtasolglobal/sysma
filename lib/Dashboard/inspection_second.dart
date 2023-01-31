
import 'dart:convert';
import 'dart:io';
import 'package:adani/Dashboard/take_audit_image.dart';
import 'package:adani/Utils/App_bar.dart';
import 'package:adani/Utils/Styles.dart';
import 'package:adani/Utils/audio_player.dart';
import 'package:adani/models/Preventive.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:awesome_stepper/awesome_stepper.dart';
import 'package:intl/intl.dart';


class InspectionSecondStep extends StatefulWidget {
  PreventiveScheduleData?sdata;
  InspectionSecondStep({Key? key, this.sdata}) : super(key: key);

  @override
  State<InspectionSecondStep> createState() => _InspectionSecondStepState();
}

class _InspectionSecondStepState extends State<InspectionSecondStep> {
  final _formKey = GlobalKey<FormState>();
  var currentPage;
  var totalPage;
  TextEditingController controller = TextEditingController();
  TextEditingController commentController1 = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController remarkController = TextEditingController();
  XFile? selectedImage1;

  String? insImg;
  String selectedValue1='';
  String? selectedValue2;
  String? dropRejVal;
  String? brlVal;
  String? brhVal;


  List<dynamic> assetParameterValue = [];
  List<dynamic> assetId = [];
  List jsonData = [];

  List assetParamTrans = [];
  var insParam = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentPage = 0;
    assetParameterValue= jsonDecode(widget.sdata!.auditParamsValues.toString());
    assetId = assetParameterValue.reversed.map((e) => e['id']).toList();
    totalPage = assetParameterValue.length;
    for(var p=0; p<assetParameterValue.length;p++){
      assetParamTrans.add({
        "audit_asset_image":'',
        "audit_param_name":assetParameterValue[p]['param_disp_name'],
        "audit_param_value":'',
        "inspection_img":'',
        "inspection_comment":''
      });
    }
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar().getAppbar(context, "Fill Parameters1"),
      body: Padding(
        padding: const EdgeInsets.only(left: 5.0,right: 5.0,bottom: 10.0),
        child: AwesomeStepper(
          headerColor: Colors.white24,
          progressColor: primarycolor,
          headerStyle: title,
          headerHeight: 100,
          progressBarAnimationDuration: const Duration(milliseconds:0010),
          headerAnimationDuration: const Duration(milliseconds:0010),
          progressStyle: const TextStyle(color: Colors.black54, fontSize: 14,),
          controlBuilder: (onNext, onBack) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 17),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 55.0),
                      backgroundColor: Colors.grey[300],
                    ),
                    onPressed: currentPage > 0 ? (){
                      setState(() {
                        assetParamTrans[currentPage]['audit_param_value']='';
                        assetParamTrans[currentPage]['inspection_img']='';
                        assetParamTrans[currentPage]['inspection_comment']='';
                        selectedValue1 = 'Select Option';
                        selectedImage1 = null;
                        insImg=null;
                        commentController1.clear();
                        dateController.clear();
                        remarkController.clear();
                        controller.clear();
                      });
                      jsonData.removeLast();
                      onBack();
                    }: null,
                    child: const Text("Previous",style: TextStyle(color: primarycolor,fontSize: 16,fontWeight: FontWeight.w500),),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 17),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 65.0),
                      backgroundColor: primarycolor,
                    ),
                    onPressed:currentPage < totalPage ? (){
                      if (selectedValue1 == 'Select Option' || selectedValue1.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Please fill all details")));
                      }else {
                        try {
                          // double.parse(selectedValue1) < double.parse(brlVal.toString()) && double.parse(selectedValue1) > double.parse(brhVal.toString());
                          if (double.parse(selectedValue1) < double.parse(brlVal.toString()) && double.parse(selectedValue1) > double.parse(brhVal.toString())) {
                            if (selectedImage1 != null && commentController1.text.isNotEmpty) {
                              jsonData.add({
                                "dropDownValue": selectedValue1,
                                "imageValue": selectedImage1 != null ? selectedImage1 : null,
                                "commentValue": commentController1.text.isNotEmpty
                                    ? commentController1.text
                                    : null
                              });

                              setState(() {
                                assetParamTrans[currentPage]['audit_param_value']=selectedValue1;
                                assetParamTrans[currentPage]['inspection_img']=insImg;
                                assetParamTrans[currentPage]['inspection_comment']=commentController1.text;

                                selectedValue1 = 'Select Option';
                                selectedImage1 = null;
                                insImg=null;
                                commentController1.clear();
                                remarkController.clear();
                                dateController.clear();
                                controller.clear();
                              });
                              currentPage < totalPage - 1 ?
                              onNext() :
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                  TakeAuditImage(insList: jsonData,
                                      insIds: assetId,
                                      insParamTrans:assetParamTrans,
                                      sdata: widget.sdata,
                                      psi: controller.text),));
                            }
                            else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Please fill all details")));
                            }
                          }
                          else {
                            jsonData.add({
                              "dropDownValue": selectedValue1,
                              "imageValue": selectedImage1 != null ? selectedImage1 : null,
                              "commentValue": commentController1.text.isNotEmpty
                                  ? commentController1.text
                                  : null
                            });
                            setState(() {
                              assetParamTrans[currentPage]['audit_param_value']=selectedValue1;
                              assetParamTrans[currentPage]['inspection_img']=insImg;
                              assetParamTrans[currentPage]['inspection_comment']=commentController1.text;

                              selectedValue1 = 'Select Option';
                              selectedImage1 = null;
                              insImg=null;
                              commentController1.clear();
                              remarkController.clear();
                              dateController.clear();
                              controller.clear();
                            });
                            currentPage < totalPage - 1 ?
                            onNext() :
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                TakeAuditImage(insList: jsonData,
                                    insIds: assetId,
                                    insParamTrans:assetParamTrans,
                                    sdata: widget.sdata,
                                    psi: controller.text),));
                          }
                        }
                        catch (e) {
                          if (selectedValue1 == dropRejVal) {
                            if (selectedImage1 != null && commentController1.text.isNotEmpty) {
                              jsonData.add({
                                "dropDownValue": selectedValue1,
                                "imageValue": selectedImage1 != null ? selectedImage1 : null,
                                "commentValue": commentController1.text.isNotEmpty
                                    ? commentController1.text
                                    : null
                              });
                              setState(() {
                                assetParamTrans[currentPage]['audit_param_value']=selectedValue1;
                                assetParamTrans[currentPage]['inspection_img']=insImg;
                                assetParamTrans[currentPage]['inspection_comment']=commentController1.text;

                                selectedValue1 = 'Select Option';
                                selectedImage1 = null;
                                insImg=null;
                                commentController1.clear();
                                remarkController.clear();
                                dateController.clear();
                                controller.clear();
                              });
                              currentPage < totalPage - 1 ?
                              onNext() :
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                  TakeAuditImage(insList: jsonData,
                                      insIds: assetId,
                                      insParamTrans:assetParamTrans,
                                      sdata: widget.sdata,
                                      psi: controller.text),));
                            }
                            else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Please fill all details")));
                            }
                          }
                          else {
                            jsonData.add({
                              "dropDownValue": selectedValue1,
                              "imageValue": selectedImage1 != null ? selectedImage1 : null,
                              "commentValue": commentController1.text.isNotEmpty
                                  ? commentController1.text
                                  : null
                            });
                            setState(() {
                              assetParamTrans[currentPage]['audit_param_value']=selectedValue1;
                              assetParamTrans[currentPage]['inspection_img']=insImg;
                              assetParamTrans[currentPage]['inspection_comment']=commentController1.text;

                              selectedValue1 = 'Select Option';
                              selectedImage1 = null;
                              insImg=null;
                              commentController1.clear();
                              remarkController.clear();
                              dateController.clear();
                              controller.clear();
                            });
                            currentPage < totalPage - 1 ?
                            onNext() :
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                TakeAuditImage(insList: jsonData,
                                  insIds: assetId,
                                  insParamTrans:assetParamTrans,
                                  sdata: widget.sdata,
                                  psi: controller.text,
                                ),
                            ));
                          }
                        }
                      }
                    }: null,
                    child: const Text("Next",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500)),
                  ),
                ),
              ],
            );
          },
          onStepChanged: (page) {
            setState(() {
              currentPage = page;
            });
            print(assetParamTrans);
          },
          steps:getStep(assetParameterValue.reversed),
        ),
      ),
    );
  }

  List<AwesomeStepperItem> getStep(assetParameterValue) {
    List<AwesomeStepperItem> assetParameterValue2 = [];
    for (var e in assetParameterValue) {
      assetParameterValue2.add(
          AwesomeStepperItem(
            label: '${e['param_disp_name']}',
            content: Form(
              key: _formKey,
              child: ListView(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 100,
                    child: audioplay(playerdata: e['audit_param_audio_path']),
                  ),
                  e['param_type'] == 'Number'?
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 20.0),
                    child: TextFormField(
                      keyboardType: const TextInputType.numberWithOptions(decimal: true,),
                      textInputAction: TextInputAction.next,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
                      ],
                      controller: controller,
                      style: listHeading,
                      // validator: (value) {
                      //   if(value == null || value.isEmpty || value ==''){
                      //     return ' ';
                      //   }else{
                      //     return null;
                      //   }
                      // },
                      onChanged: (value) {
                        print('tezt value');
                        print(value);
                        if(value == null || value.isEmpty){
                          // setState(() {
                          //   selectedValue1 = 0.toString();
                          //   brlVal = e['benchmark_range_low'].toString();
                          //   brhVal = e['benchmark_range_high'].toString();
                          //   dropRejVal = e['dropdown_reject_value'];
                          // });
                        }
                        // else if(value != RegExp('[.]')){}
                        else{
                          setState(() {
                            selectedValue1 = value;
                            brlVal = e['benchmark_range_low'].toString();
                            brhVal = e['benchmark_range_high'].toString();
                            dropRejVal = e['dropdown_reject_value'];
                          });
                        }
                      },
                      decoration:InputDecoration(
                        // isDense: true,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 12),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: grey_400, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: grey_400, width: 1.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: grey_400, width: 1.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: grey_400, width: 1.0),
                        ),
                        filled: false,
                        // fillColor:Colors.transparent,
                        hintText: "Enter",
                        hintStyle:  listHeading,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(width: 1,color: white),
                          gapPadding: 0,
                        ),
                      ),
                    ),
                  ):
                  e['param_type'] == 'Date'?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 10),
                    child: SizedBox(
                      height: 40,
                      child: TextFormField(
                        onTap: _pickDateDialog,
                        keyboardType: TextInputType.datetime,
                        controller: dateController,
                        // maxLength: 10,
                        style: listHeading,
                        readOnly: true,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.calendar_month_rounded,size: 20,color: grey_400,),
                          suffixIconColor: grey_400,
                          focusColor: grey_400,
                          border: OutlineInputBorder(borderSide: BorderSide(color: grey_400)),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: grey_400)),
                          hintText: 'Select Date',
                          hintStyle: greysubtext,
                          contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 0),
                          errorStyle: TextStyle(color: Colors.white),
                        ),
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return 'Please select date';
                          }
                          return null;
                        },
                      ),
                    ),
                  ):
                  e['param_type'] == 'Text'?
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 20.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      controller: remarkController,
                      style: listHeading,
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return ' ';
                        }else{
                          return null;
                        }
                      },
                      onChanged: (value) {
                        setState(() {
                          selectedValue1 = value;
                        });
                      },
                      maxLines: 5,
                      decoration:InputDecoration(
                        // isDense: true,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 12),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: grey_400, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: grey_400, width: 1.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: grey_400, width: 1.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: grey_400, width: 1.0),
                        ),
                        filled: false,
                        hintText: "Remark",
                        hintStyle:  greysubtext,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(width: 1,color: white),
                          gapPadding: 0,
                        ),
                      ),
                    ),
                  ):
                  e['param_type'] == 'Drop-down'?
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 20.0),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        key: UniqueKey(),
                        isExpanded: true,
                        hint: selectedValue1.isNotEmpty?
                        Text(selectedValue1.toString(), style: listHeading, overflow: TextOverflow.ellipsis,):
                        const Text('Select Option', style: listHeading, overflow: TextOverflow.ellipsis,),
                        items: e['dropdown_values'].toString().split(',').map((item)  => DropdownMenuItem<String>(
                          value: item  ,child: Text(item, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold,),
                          overflow: TextOverflow.ellipsis,
                        ),)).toList(),

                        value: selectedValue2,
                        onChanged: (value) {
                          print(value);
                          setState(() {
                            selectedValue1 = value.toString();
                            dropRejVal = e['dropdown_reject_value'];
                          });
                        },
                        icon: const Icon(Icons.arrow_drop_down_outlined,),
                        iconSize: 24,
                        iconEnabledColor: primarycolor,
                        iconDisabledColor:primarycolor,
                        buttonHeight: 50,
                        buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                        buttonDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: grey_400,),
                          color: Colors.white,
                        ),
                        buttonElevation: 0,
                        itemHeight: 40,
                        itemPadding: const EdgeInsets.only(left: 14, right: 14),
                        dropdownMaxHeight: 200,
                        dropdownPadding: null,
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        dropdownElevation: 2,
                        scrollbarRadius: const Radius.circular(40),
                        scrollbarThickness: 4,
                        scrollbarAlwaysShow: true,
                      ),
                    ),
                  ):

                  Center(child: Text('param_type = ${e['param_type']}'),),

                  e['param_type'] == 'Number' && selectedValue1.isNotEmpty && controller.text.isNotEmpty ?
                  double.parse(selectedValue1) >= double.parse(e['benchmark_range_low'].toString()) && double.parse(selectedValue1) <= double.parse(e['benchmark_range_high'].toString())?
                  const SizedBox():
                  Column(
                    children: [
                      selectedImage1 != null?
                      InkWell(
                        onTap: () =>_getImage1(source: ImageSource.camera),
                        child: Image.file(File(selectedImage1!.path),height: 150,),
                      ):
                      InkWell(
                        onTap: () =>_getImage1(source: ImageSource.camera),
                        child: const Icon(Icons.camera_alt_outlined,size: 80,color: primarycolor,),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 20.0),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          controller: commentController1,
                          style: listHeading,
                          validator: (value) {
                            if(value == null || value.isEmpty){
                              return ' ';
                            }else{
                              return null;
                            }
                          },
                          maxLines: 5,
                          decoration:InputDecoration(
                            // isDense: true,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 12),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: grey_400, width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: grey_400, width: 1.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: grey_400, width: 1.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: grey_400, width: 1.0),
                            ),
                            filled: false,
                            hintText: "Comment",
                            hintStyle:  listHeading,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(width: 1,color: white),
                              gapPadding: 0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ):
                  // selectedValue1.isNotEmpty && selectedValue1 == e['dropdown_reject_value']?
                  selectedValue1 == 'Select Option' || selectedValue1.isEmpty || selectedValue1 == ''?
                  // selectedValue1.isNotEmpty?
                  const SizedBox():
                  Column(
                    children: [
                      selectedImage1 != null?
                      InkWell(
                        onTap: () =>_getImage1(source: ImageSource.camera),
                        child: Image.file(File(selectedImage1!.path),height: 150,),
                      ):
                      InkWell(
                        onTap: () =>_getImage1(source: ImageSource.camera),
                        child: const Icon(Icons.camera_alt_outlined,size: 80,color: primarycolor,),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 20.0),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          controller: commentController1,
                          style: listHeading,
                          validator: (value) {
                            if(value == null || value.isEmpty){
                              return ' ';
                            }else{
                              return null;
                            }
                          },
                          maxLines: 5,
                          decoration:InputDecoration(
                            // isDense: true,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 12),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: grey_400, width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: grey_400, width: 1.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: grey_400, width: 1.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: grey_400, width: 1.0),
                            ),
                            filled: false,
                            hintText: "Comment",
                            hintStyle:  listHeading,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(width: 1,color: white),
                              gapPadding: 0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
      );
    }
    return assetParameterValue2;
  }

  /// Get image from gallery or Camera
  _getImage1({source}) async {
    XFile? pickedFile = await ImagePicker().pickImage(source: source,
        maxHeight: 300,
        maxWidth: 150,
        imageQuality: 50);
    if (pickedFile != null) {
      setState(() {
        selectedImage1 = pickedFile;
        File file = File(pickedFile.path);
        insImg = base64Encode(file.readAsBytesSync());
      });
    }
  }

  ///Method for showing the date picker
  void _pickDateDialog() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        //which date will display when user open the picker
        firstDate: DateTime(1950),
        //what will be the previous supported year in picker
        lastDate: DateTime(DateTime.now().year+2))//what will be the up to supported date in picker
        .then((pickedDate){
      //then usually do the future job
      if (pickedDate == null) {
        //if user tap cancel then this function will stop
        return;
      }
      setState(() {
        dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
        selectedValue1 = DateFormat('yyyy-MM-dd').format(pickedDate);
        //for rebuilding the ui
        // _selectedDate = pickedDate;
      });
    });
  }
}
