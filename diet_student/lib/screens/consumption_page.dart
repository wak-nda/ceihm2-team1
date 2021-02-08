import 'dart:ui';

import 'package:diet_student/common/box_shadows.dart';
import 'package:diet_student/common/values.dart';
import 'package:diet_student/screens/sub_screens/new_meal.dart';
import 'file:///C:/Users/ndaug/StudioProjects/ceihm2-team1/diet_student/lib/screens/sub_screens/seeMoreMeals.dart';
import 'package:flutter/material.dart';

class ConsumptionPage extends StatefulWidget {
  @override
  _ConsumptionPageState createState() => _ConsumptionPageState();
}

class _ConsumptionPageState extends State<ConsumptionPage> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 2);
    _tabController.addListener(_handleTabSelection);
    _tabController.index = 0;
  }

  void _handleTabSelection() {
    setState(() {
      manualEntry = false;
      backScan = false;
      typeBarcode = false;
      scanNotFound = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          toolbarHeight: 50,
          bottom: TabBar(
            controller: _tabController,
            isScrollable: false,
            indicatorColor: Colors.white,
            indicatorWeight: 2.0,
            tabs: <Widget>[
              Tab(
                child: Container(
                  height: _tabController.index == 0 ? 35.0 : 30.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(28),
                        bottomLeft: Radius.circular(28),
                      ),
                      boxShadow: [
                        _tabController.index == 0 ? enabledBox : disabledBox,
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Ajouter",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Tab(
                child: Container(
                  height: _tabController.index == 1 ? 35.0 : 30.0,
                  margin: EdgeInsets.only(left: 2),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(28),
                        bottomRight: Radius.circular(28),
                      ),
                      boxShadow: [
                        _tabController.index == 1 ? enabledBox : disabledBox,
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Consommations",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Container(
          /*decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/home_page2_1.jpg"),
              fit: BoxFit.cover,
            ),
          ),*/
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                NewMealView(),
                SeeMoreMeals(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
