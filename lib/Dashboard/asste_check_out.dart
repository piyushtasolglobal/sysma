import 'package:adani/Dashboard/db/sqlite_service.dart';
import 'package:adani/Utils/App_bar.dart';
import 'package:adani/Utils/Styles.dart';
import 'package:adani/Utils/constants.dart';
import 'package:adani/Utils/textfield_style.dart';
import 'package:adani/controllar/Apis.dart';
import 'package:adani/controllar/data_manager.dart';
import 'package:adani/models/LocationModel.dart';
import 'package:adani/models/Preventive.dart';
import 'package:adani/models/SelectAssetModel.dart';
import 'package:adani/models/SelectStatusModel.dart';
import 'package:adani/models/SelectUserModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AssetCheckOut extends StatefulWidget {
  PreventiveScheduleData?scheduleData;
  AssetCheckOut({Key? key, this.scheduleData}) : super(key: key);

  @override
  State<AssetCheckOut> createState() => _AssetCheckOutState();
}

class _AssetCheckOutState extends State<AssetCheckOut> {
  TextEditingController dateController = TextEditingController();
  TextEditingController exDateController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  bool loading = true;

  final List<String> users = [
    'user',
    'location',
    'asset',
  ];
  String checkOutTo = 'user';

  List<StatusData> statusList=[];
  List<StatusData> statusListTemp=[];
  String selectedStatus = 'Select Status';
  int? statusId;

  List<UserData> usersList=[];
  String selectedUser = '';
  int?userId;
  List<LocationData> locationList=[];
  String selectedValue2 = 'Select Location';
  int? locationId;
  List<AssetsData> assetsList=[];
  String selectedAsset = 'Select Asset';
  int? assetId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dateController.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
    exDateController.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
    load();
    // print(dbHelper().getPreventiveSchedules(widget.scheduleData!.id));
  }

  load(){
    Api().getStatusList().then((value){
      setState(() {
        statusListTemp = value.rows!;
        statusList = statusListTemp.where((element) => element.type == "deployable").toList();
        selectedStatus = statusList.first.name!;
        statusId = statusList.first.id!.toInt();
      });
    });
    Api().getUserList().then((value){
      setState(() {
        usersList = value.results!;
        selectedUser = value.results!.first.text!;
        userId = value.results!.first.id!.toInt();
        // loading = false;
      });
    });
    Api().getLocationList().then((value){
      setState(() {
        locationList = value.results!;
        selectedValue2 = value.results!.first.text!;
        locationId = value.results!.first.id!.toInt();
        // loading = false;
      });
    });
    Api().getAssetsList().then((value){
      setState(() {
        assetsList = value.results!;
        selectedAsset = value.results!.first.text!;
        assetId = value.results!.first.id!.toInt();
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      loading == true?
      const Center(child: CircularProgressIndicator(color: primarycolor,strokeWidth: 4,)):
      Scaffold(
        appBar:Appbar().getAppbar(context, "Check Out Asset"),
        body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Column(
                    children: [
                      const SizedBox(height: 30,),
                      Text("${widget.scheduleData!.auditName}",style: pricolortext,),
                      const SizedBox(height: 15,),
                      Text("${widget.scheduleData!.location}",style: redtext,),
                      const SizedBox(height: 15,),
                      Text("${widget.scheduleData!.assetTag}",style: greytext,),
                      const SizedBox(height: 30,),
                    ],
                  ),
              ],),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
              child: Table(
                columnWidths: const <int, TableColumnWidth>{
                  0: FixedColumnWidth(100),
                  1:FixedColumnWidth(10)
                },
                children:[
                  TableRow(
                      decoration: const BoxDecoration(color:Color(0xFFF8F5F5))
                      ,children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10.0,top: 10,left: 5),
                      child: Text("Category",style: title,),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10.0,top: 10),
                      child: Text(":",style: greytext,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0,top: 10,left: 13),
                      child: Text("${widget.scheduleData!.categoryName}",style: listHeading,),
                    )
                  ]),
                  TableRow(children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10.0,top: 20,left: 5),
                      child: Text("Checkout To",style: title,),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10.0,top: 20),
                      child: Text(":",style: greytext,),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          isExpanded: true,
                          hint: const Text(
                            'Select User',
                            style: listHeading, overflow: TextOverflow.ellipsis,
                          ),
                          items: users.map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(item,
                              style: listHeading,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )).toList(),
                          value: checkOutTo,
                          onChanged: (value) {
                            setState(() {
                              checkOutTo = value!;
                            });
                          },
                          icon: const Icon(Icons.arrow_drop_down_outlined,),
                          iconSize: 24,
                          iconEnabledColor: primarycolor,
                          iconDisabledColor:primarycolor,
                          buttonHeight: 40,
                          buttonPadding: const EdgeInsets.only(left: 5, right: 5),
                          buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: grey_400,),
                            color: Colors.white,
                          ),
                          buttonElevation: 0,
                          itemHeight: 40,
                          itemPadding: const EdgeInsets.only(left: 5, right: 5),
                          dropdownMaxHeight: 200,
                          dropdownPadding: null,
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          dropdownElevation: 2,
                          scrollbarRadius: const Radius.circular(40),
                          scrollbarThickness: 4,
                          scrollbarAlwaysShow: true,
                        ),
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0,top: 20,left: 5),
                      child: Text("Select ${capitalize(checkOutTo)}",style: title,),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10.0,top: 20),
                      child: Text(":",style: greytext,),
                    ),
                    checkOutTo == 'user'?
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          isExpanded: true,
                          hint: const Text(
                            'Select User',
                            style: listHeading, overflow: TextOverflow.ellipsis,
                          ),
                          items: usersList.map((item) => DropdownMenuItem<String>(
                            value: item.text,
                            child: Text(item.text.toString(),
                              style: listHeading,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          )).toList(),
                          value: selectedUser,
                          onChanged: (value) {
                            setState(() {
                              selectedUser = value!;
                            });
                            usersList.forEach((element) {
                              if(element.text == value){
                                setState(() {
                                  userId = element.id!.toInt();
                                });
                              }
                            });
                          },
                          icon: const Icon(Icons.arrow_drop_down_outlined,),
                          iconSize: 24,
                          iconEnabledColor: primarycolor,
                          iconDisabledColor:primarycolor,
                          buttonHeight: 40,
                          buttonPadding: const EdgeInsets.only(left: 5, right: 5),
                          buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: grey_400,),
                            color: Colors.white,
                          ),
                          buttonElevation: 0,
                          itemHeight: 40,
                          itemPadding: const EdgeInsets.only(left: 5, right: 5),
                          dropdownMaxHeight: 250,
                          dropdownPadding: null,
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          dropdownElevation: 2,
                          scrollbarRadius: const Radius.circular(40),
                          scrollbarThickness: 4,
                          scrollbarAlwaysShow: true,
                        ),
                      ),
                    ):checkOutTo =="location"?
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          isExpanded: true,
                          hint: Text(
                            selectedValue2,
                            style: listHeading, overflow: TextOverflow.ellipsis,
                          ),
                          items: locationList.map((item) => DropdownMenuItem<String>(
                            value: item.text,
                            child: Text(item.text.toString(),
                              style: listHeading,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          )).toList(),
                          value: selectedValue2,
                          onChanged: (value) {
                            setState(() {
                              selectedValue2 = value!;
                            });
                            locationList.forEach((element) {
                              if(element.text == value){
                                setState(() {
                                  locationId = element.id!.toInt();
                                });
                              }
                            });
                          },
                          icon: const Icon(Icons.arrow_drop_down_outlined,),
                          iconSize: 24,
                          iconEnabledColor: primarycolor,
                          iconDisabledColor:primarycolor,
                          buttonHeight: 40,
                          buttonPadding: const EdgeInsets.only(left: 0, right:5),
                          buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: grey_400,),
                            color: Colors.white,
                          ),
                          buttonElevation: 0,
                          itemHeight: 40,
                          itemPadding: const EdgeInsets.only(left: 5, right: 5),
                          dropdownMaxHeight: 250,
                          dropdownPadding: null,
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          dropdownElevation: 2,
                          scrollbarRadius: const Radius.circular(40),
                          scrollbarThickness: 4,
                          scrollbarAlwaysShow: true,
                        ),
                      ),
                    ):
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          isExpanded: true,
                          hint: Text(
                            selectedAsset,
                            style: listHeading, overflow: TextOverflow.ellipsis,
                          ),
                          items: assetsList.map((item) => DropdownMenuItem<String>(
                            value: item.text,
                            child: Text(item.text.toString(),
                              style: listHeading,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          )).toList(),
                          value: selectedAsset,
                          onChanged: (value) {
                            setState(() {
                              selectedAsset = value!;
                            });
                            assetsList.forEach((element) {
                              if(element.text == value){
                                setState(() {
                                  assetId = element.id!.toInt();
                                });
                              }
                            });
                          },
                          icon: const Icon(Icons.arrow_drop_down_outlined,),
                          iconSize: 24,
                          iconEnabledColor: primarycolor,
                          iconDisabledColor:primarycolor,
                          buttonHeight: 40,
                          buttonPadding: const EdgeInsets.only(left: 0, right:5),
                          buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: grey_400,),
                            color: Colors.white,
                          ),
                          buttonElevation: 0,
                          itemHeight: 40,
                          itemPadding: const EdgeInsets.only(left: 5, right: 5),
                          dropdownMaxHeight: 250,
                          dropdownPadding: null,
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          dropdownElevation: 2,
                          scrollbarRadius: const Radius.circular(40),
                          scrollbarThickness: 4,
                          scrollbarAlwaysShow: true,
                        ),
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10.0,top: 20,left: 5),
                      child: Text("Date",style: title,),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10.0,top: 20),
                      child: Text(":",style: greytext,),
                    ),
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
                            // disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: grey_400)),
                            // enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: grey_400)),
                            border: OutlineInputBorder(borderSide: BorderSide(color: grey_400)),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: grey_400)),
                            hintText: 'Select Date',
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
                    ),
                  ]),
                  TableRow(children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10.0,top: 20,left: 5),
                      child: Text("Expected Date",style: title,),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10.0,top: 20),
                      child: Text(":",style: greytext,),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 10),
                      child: SizedBox(
                        height: 40,
                        child: TextFormField(
                          onTap: _exDateDialog,
                          keyboardType: TextInputType.datetime,
                          controller: exDateController,
                          // maxLength: 10,
                          style: listHeading,
                          readOnly: true,
                          decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.calendar_month_rounded,size: 20,color: grey_400,),
                            suffixIconColor: grey_400,
                            focusColor: grey_400,
                            // disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: grey_400)),
                            // enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: grey_400)),
                            border: OutlineInputBorder(borderSide: BorderSide(color: grey_400)),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: grey_400)),
                            hintText: 'Select Date',
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
                    ),
                  ]),
                  TableRow(children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10.0,top: 20,left: 5),
                      child: Text("Status",style: title,),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10.0,top: 20),
                      child: Text(":",style: greytext,),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          isExpanded: true,
                          hint:Text(selectedStatus, style: listHeading, overflow: TextOverflow.ellipsis,),
                          items: statusList.map((item) => DropdownMenuItem<String>(
                            value: item.name,
                            child: Text(item.name.toString(),
                              style: listHeading,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          )).toList(),
                          value: selectedStatus,
                          onChanged: (value) {
                            setState(() {
                              selectedStatus = value!;
                            });
                            statusList.forEach((element) {
                              if(element.name == value){
                                setState(() {
                                  statusId = element.id!.toInt();
                                });
                              }
                            });
                          },
                          icon: const Icon(Icons.arrow_drop_down_outlined,),
                          iconSize: 24,
                          iconEnabledColor: primarycolor,
                          iconDisabledColor:primarycolor,
                          buttonHeight: 40,
                          buttonPadding: const EdgeInsets.only(left: 5, right: 5),
                          buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: grey_400,),
                            color: Colors.white,
                          ),
                          buttonElevation: 0,
                          itemHeight: 40,
                          itemPadding: const EdgeInsets.only(left: 5, right: 5),
                          dropdownMaxHeight: 250,
                          dropdownPadding: null,
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          dropdownElevation: 2,
                          scrollbarRadius: const Radius.circular(40),
                          scrollbarThickness: 4,
                          scrollbarAlwaysShow: true,
                        ),
                      ),
                    ),
                  ]),
                  TableRow(
                      decoration: const BoxDecoration(color:Color(0xFFF8F5F5)),
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10.0,top: 10,left: 5),
                          child: Text("Notes",style: title,),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10.0,top: 10),
                          child: Text(":",style: greytext,),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 10),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: noteController,
                            // maxLength: 10,
                            maxLines: 5,
                            style: listHeading,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(borderSide: BorderSide(color: grey_400)),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: grey_400)),
                              hintText: 'Notes',
                              contentPadding: EdgeInsets.symmetric(vertical:5,horizontal: 5),
                              errorStyle: TextStyle(color: Colors.white),
                            ),
                            validator: (value){
                              if(value == null || value.isEmpty){
                                return 'Please Enter Note';
                              }
                              return null;
                            },
                          ),
                        ),
                      ]),
                ],
              ),
            ),
          ],
        ),
      ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(MediaQuery.of(context).size.width*0.9, 40),
              padding: const EdgeInsets.symmetric(horizontal: 55.0),
              backgroundColor: primarycolor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            onPressed: () {
              var data = {
                "status_id":statusId.toString(),
                "checkout_to_type":checkOutTo,
                "assigned_user":userId.toString(),
                "assigned_location":'',
                "assigned_asset":"",
                "checkout_at":dateController.text,
                "expected_checkin":exDateController.text,
                "note":noteController.text
              };
              var data1 = {
                "status_id":statusId.toString(),
                "checkout_to_type":checkOutTo,
                "assigned_user":'',
                "assigned_location":locationId.toString(),
                "assigned_asset":"",
                "checkout_at":dateController.text,
                "expected_checkin":exDateController.text,
                "note":noteController.text
              };
              var data2 = {
                "status_id":statusId.toString(),
                "checkout_to_type":checkOutTo,
                "assigned_user":'',
                "assigned_location":'',
                "assigned_asset":assetId.toString(),
                "checkout_at":dateController.text,
                "expected_checkin":exDateController.text,
                "note":noteController.text
              };
              Api().assetCheckOut(
                  assetId: widget.scheduleData!.assetTagId,
                  bodyData: checkOutTo=="user"?data:checkOutTo=="location"?data1:data2
              ).then((value){
                if(value['status'] == 'error'){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(value['messages'].toString()),
                      behavior: SnackBarBehavior.floating,
                      width: MediaQuery.of(context).size.width * 0.8,
                    ),
                  );
                }
                if(value['status'] == 400){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(value['message'].toString()),
                      behavior: SnackBarBehavior.floating,
                      width: MediaQuery.of(context).size.width * 0.8,
                    ),
                  );
                }
                else{
                  dbHelper().getDb()!.then((value) {
                    value.rawUpdate(
                        "UPDATE Schedule SET canCheckin = ?, canCheckout = ? WHERE auditSchduleId = ?",
                        [1, 0, widget.scheduleData!.auditSchduleId]);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(value['messages'].toString()),
                      behavior: SnackBarBehavior.floating,
                      width: MediaQuery.of(context).size.width * 0.8,
                    ),
                  );
                  Navigator.pop(context);
                }
              });
              },
            child: const Text("Check Out",style: buttontextstyle),
          ),
        ),
      );
  }

  //Method for showing the date picker
  void _pickDateDialog() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        //which date will display when user open the picker
        firstDate: DateTime(1950),
        //what will be the previous supported year in picker
        lastDate: DateTime
            .now()) //what will be the up to supported date in picker
        .then((pickedDate) {
      //then usually do the future job
      if (pickedDate == null) {
        //if user tap cancel then this function will stop
        return;
      }
      setState(() {
        dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
        //for rebuilding the ui
        // _selectedDate = pickedDate;
      });
    });
  }

  void _exDateDialog() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        //which date will display when user open the picker
        firstDate: DateTime.now(),
        //what will be the previous supported year in picker
        lastDate: DateTime(DateTime.now().year+1, DateTime.now().month, DateTime.now().day)) //what will be the up to supported date in picker
        .then((pickedDate) {
      //then usually do the future job
      if (pickedDate == null) {
        //if user tap cancel then this function will stop
        return;
      }
      setState(() {
        exDateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
        //for rebuilding the ui
        // _selectedDate = pickedDate;
      });
    });
  }
}
