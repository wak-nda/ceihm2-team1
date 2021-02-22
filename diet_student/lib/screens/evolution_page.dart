import 'dart:ui';

import 'package:diet_student/common/box_shadows.dart';
import 'package:diet_student/common/values.dart';
import 'package:diet_student/models/food_model.dart';
import 'package:diet_student/screens/sub_screens/seeMoreGraphs.dart';
import 'package:flutter/material.dart';

class EvolutionPage extends StatefulWidget {
  @override
  _EvolutionPageState createState() => _EvolutionPageState();
}

class _EvolutionPageState extends State<EvolutionPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 3);
    _tabController.addListener(_handleTabSelection);
    _tabController.index = 1;
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double glucides = 0;
    double proteines =  0;
    double lipides = 0;
    for(FoodModel food in foods){
      glucides = glucides + food.carbohydrates;
      proteines = proteines + food.protein;
      lipides = lipides + food.lipids;
    }
    return DefaultTabController(
      length: 3,
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
                        "Semaine",
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
                  decoration: BoxDecoration(color: Colors.white,
                      //borderRadius: BorderRadius.all(Radius.circular(28)),
                      boxShadow: [
                        _tabController.index == 1 ? enabledBox : disabledBox,
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Jour",
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
                  height: _tabController.index == 2 ? 35.0 : 30.0,
                  margin: EdgeInsets.only(left: 2),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(28),
                        bottomRight: Radius.circular(28),
                      ),
                      boxShadow: [
                        _tabController.index == 2 ? enabledBox : disabledBox,
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Mois",
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
                //Container(),
                //Container(),
                //Container(),

                SeeMoreGraphs(glucide: glucides, protein: proteines, lipid: lipides,),
                SeeMoreGraphs(glucide: glucides, protein: proteines, lipid: lipides,),
                SeeMoreGraphs(glucide: glucides, protein: proteines, lipid: lipides,),
                //SeeMoreGraphs(glucide: 5, protein: 10, lipid: 15,),
                //SeeMoreGraphs(glucide: 65, protein: 10, lipid: 25,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
