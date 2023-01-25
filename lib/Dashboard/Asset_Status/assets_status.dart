
import 'package:adani/Dashboard/Asset_Status/Breakdown.dart';
import 'package:adani/Dashboard/Asset_Status/Operational_screen.dart';
import 'package:adani/Utils/Styles.dart';

import 'package:flutter/material.dart';
import '../../Utils/App_bar.dart';

class Asset_status extends StatefulWidget {
  const Asset_status({Key? key}) : super(key: key);

  @override
  State<Asset_status> createState() => _Asset_statusState();
}

class _Asset_statusState extends State<Asset_status> {
  TabController? _tapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar().getAppbar(context, "Assets Status"),
      backgroundColor: white,
      body: DefaultTabController(length: 2,
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.,
          children: [
            Container(
              color: const Color(0xFFF6F5F5),
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              height: 50,
              width: MediaQuery.of(context).size.width,
              child:TabBar(
                controller: _tapController,
                labelColor: white,
                isScrollable: false,
                indicatorWeight: 0.0,
                unselectedLabelColor: black,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: EdgeInsets.zero,
                unselectedLabelStyle: listHeading,
                labelPadding: const EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                padding: EdgeInsets.zero,
                indicator: const BoxDecoration(
                  color: primarycolor,
                ),
                tabs:<Widget> [

                  Tab(icon: Row(
                    children: const [
                      Icon(Icons.settings_rounded,),
                      SizedBox(width: 5,),
                      Text("Operational",),
                    ],
                  ),),
                  Tab(icon: Row(
                    children: const [
                      Icon(Icons.settings_rounded,),
                      SizedBox(width: 5,),
                      Text("Breakdown",),
                    ],
                  ),),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: TabBarView(
                controller: _tapController,
                children: const [
                  Operational(),
                  BreakdownAsset(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
