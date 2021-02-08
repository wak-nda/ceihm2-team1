import 'dart:ui';

import 'package:diet_student/common/gradient.dart';
import 'file:///C:/Users/ndaug/StudioProjects/ceihm2-team1/diet_student/lib/components/loader.dart';
import 'package:diet_student/mocks/daily_report_mocks.dart';
import 'package:diet_student/mocks/food_mocks.dart';
import 'package:diet_student/models/daily_report_model.dart';
import 'package:diet_student/models/food_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double screenWidth, screenHeight;

  List<DailyReportModel> _getDailyReport() {
    return DAILY_REPORT_MOCKS
        .map((model) => DailyReportModel.fromMap(model))
        .toList();
  }

  List<FoodModel> _getFoods() {
    return FOOD_MOCKS
        .map((model) => FoodModel.fromMap(model))
        .toList();
  }

  Container header() {
    return Container(
      height: 120.0,
      decoration: BoxDecoration(
        gradient: lightGreenGradient,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
    );
  }

  Positioned headerText(int weight) {
    return Positioned(
      left: 20,
      bottom: 35,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Objectif du jour',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Vous devez encore consommer 2000 calories\n pour atteindre vos objectifs !',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Positioned dailyCalNumber() {
    return Positioned(
      bottom: -30,
      child: Container(
        height: 50.0,
        width: 300,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(28)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 5.5,
                blurRadius: 5.5,
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            /*Text(
              cal + ' Kcals',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w500,
                color: midColor,
              ),
            ),*/
            Text(
              "0",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            /*SizedBox(
              width: 10,
            ),*/
            Container(
              height: 50.0,
              width: 200,
              padding: EdgeInsets.all(10),
              child: LinearProgressIndicator(
                value: 0.33,
              ),
            ),
            Text(
              "3000 cal.",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle() {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: Wrap(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: screenWidth - 280, // gap between adjacent chips
        runSpacing: 4.0, // gap between lines
        direction: Axis.horizontal, // main axis (rows or columns)
        children: <Widget>[
          Text(
            'Dernières consommations',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(
                    () => {}
              );
            },
            child: Text(
              'Voir plus',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: midColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container latestMeals() {
    List<FoodModel> foods = _getFoods();
    print(foods);
    int taille = foods.length > 2 ? foods.length-2 : 1;
    if (foods.length == 0)
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        child: Text(
          "Swipez à droite pour enregistrer un nouvel aliment",
          style: TextStyle(
            fontFamily: 'Pacifico',
            color: Colors.black,
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
        ),
      );
    else
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        decoration: BoxDecoration(
          //color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: <Widget>[
            for (int i = foods.length-1; i >= taille-1; i--) ...{
              Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Wrap(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    spacing: 4.0, // gap between adjacent chips
                    runSpacing: 4.0, // gap between lines
                    direction: Axis.horizontal, // main axis (rows or columns)
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Color(0xFFD9D9D9),
                        backgroundImage: AssetImage('images/food.png'),
                        radius: 36.0,
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      SizedBox(
                        width: 200,
                        child: RichText(
                          text: TextSpan(
                            text: foods[i].name + '\n',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              height: 1.5,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Calories : ' +
                                    foods[i].kcal.toString() +
                                    ' Kcals\n',
                                style: TextStyle(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth - 300,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Divider(
                    color: Colors.grey[200],
                    height: 3,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                ],
              ),
            }
          ],
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      body: Container(
        /*
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/home_page1.jpg"),
            fit: BoxFit.cover,
          ),
        ),*/
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.topCenter,
                overflow: Overflow.visible,
                children: <Widget>[
                  header(),
                  headerText(52),
                  dailyCalNumber(),
                ],
              ),
              SizedBox(height: 40,),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        //Container(color: Colors.red, height: 20,)
                        sectionTitle(),
                        latestMeals(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    /*
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Stack(
              alignment: AlignmentDirectional.topCenter,
              overflow: Overflow.visible,
              children: <Widget>[
                header(),
                headerText(52),
                dailyCalNumber("300"),
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    sectionTitle(),
                    //latestMeals(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );*/
  }
}
