import 'package:adani/Utils/Styles.dart';
import 'package:adani/Utils/textfield_style.dart';
import 'package:flutter/material.dart';

class check_out extends StatefulWidget {
  const check_out({Key? key}) : super(key: key);

  @override
  State<check_out> createState() => _check_outState();
}

class _check_outState extends State<check_out> {
  TextEditingController CategoryController = TextEditingController();
  TextEditingController QtyController = TextEditingController();
  TextEditingController NotesController = TextEditingController();
  String? checkouttoValue;
  String? selectuserValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Check Out",style: appbartitle,),
        centerTitle: true,
        backgroundColor: appbarbgcolor,
      ),
      backgroundColor: white,
      body: ListView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 5),
        children: [
          Text("Scan Equipment&#039;s",style: pricolortext,textAlign: TextAlign.center,),
          SizedBox(height: 10,),
          Table(
            columnWidths: const <int, TableColumnWidth>{
              0: FixedColumnWidth(90),
            },
            children:  [
              TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14.0),
                      child: Text("Category :",style: listHeading,),
                    ),

                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      height: 35,
                      child: TextFormField(
                        controller: CategoryController,
                        style: listHeading,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: inputDecoration(context,hint: "",),
                      ),
                    ),
              ]),
              TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14.0),
                      child: Text("Checkout To :",style: listHeading,),
                    ),

                        Container(
                          height: 35,
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButtonFormField<String>(
                              decoration: dropinputDecoration(context,hint: ""),
                              value: checkouttoValue,
                              icon:Icon(Icons.arrow_drop_down_outlined,color: primarycolor,),
                              isExpanded: true,
                              onChanged: (String? newValue) {
                                setState(() {
                                  checkouttoValue = newValue!;
                                });
                              },
                              items: <String>['Checkout 1', 'Checkout 2', 'Checkout 3',]
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(value,style: greytext,),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                  ]),
              TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14.0),
                      child:  Text("Select User:",style: listHeading,),
                    ),
                    Container(
                      height: 35,
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child:
                          DropdownButtonHideUnderline(
                            child: DropdownButtonFormField<String>(
                              decoration: dropinputDecoration(context,hint: ""),
                              value: selectuserValue,
                              icon:Icon(Icons.arrow_drop_down_outlined,color: primarycolor,),
                              isExpanded: true,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectuserValue = newValue!;
                                });
                              },
                              items: <String>['User 1', 'User 2', 'User 3',]
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(value,style: greytext,),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),

                    ),
                  ]),
              TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14.0),
                      child: Text("Qty:",style: listHeading,),
                    ),
                    Container(
                      height: 35,
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child:
                      TextFormField(
                              controller: QtyController,
                              style: listHeading,
                              textCapitalization: TextCapitalization.sentences,
                              decoration: inputDecoration(context,hint: "",),
                            ),
                    ),
                  ]),
              TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14.0),
                      child:Text("Notes:",style: listHeading,),
                    ),
                    Container(

                      margin: EdgeInsets.symmetric(vertical: 5),
                      child:
                          TextFormField(
                            controller: NotesController,
                            style: listHeading,
                            maxLines: 4,
                            textCapitalization: TextCapitalization.sentences,
                            decoration: inputDecoration(context,hint: "Notes",),
                          ),
                    ),
                  ]),


            ],
          ),
          SizedBox(height: 200,),

          ElevatedButton(
            onPressed: () {

              //Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingInfo(),));
            },
            style: ElevatedButton.styleFrom(
              fixedSize: Size(MediaQuery.of(context).size.width, 35),
              elevation: 0,
              shape: RoundedRectangleBorder(

                  borderRadius: BorderRadius.circular(2)),
              primary: primarycolor,
            ),
            child: const Text('Check Out', style: wlistTitleHeading,),
          ),



        ],),
    );
  }
}
