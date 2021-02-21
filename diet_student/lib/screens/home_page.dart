import 'dart:ui';

import 'package:diet_student/common/box_shadows.dart';
import 'package:diet_student/common/gradient.dart';
import 'package:diet_student/mocks/daily_report_mocks.dart';
import 'package:diet_student/mocks/food_mocks.dart';
import 'package:diet_student/models/daily_report_model.dart';
import 'package:diet_student/models/food_model.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

/*
final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];
   */

final List<String> imgList = [
  'images/diet-recommendation-1.jpg',
  'images/diet-recommendation-2.jpg',
  'images/diet-recommendation-3.jpg',
  'images/diet-recommendation-4.jpg',
  'images/diet-recommendation-5.jpg',
  'images/diet-recommendation-6.jpg',
];

final List<String> textList = [
  'Crus, cuits, en conserve ou surgelés, les fruits et légumes doivent être présents à tous les  repas. Ils peuvent aussi être consommés en dehors des repas en collation le matin ou en guise de gouter l’après-midi.',
  'Quel que soit le type de viande, il est recommandé de consommer les morceaux les moins gras comme l’escalope, le rosbif, le blanc de volaille ou le lapin.',
  'Côté poissons, les poissons gras sont intéressants pour leur apport en acides gras poly insaturés. Il  s’agit du saumon, de la truite, de la sardine, du maquereau etc',
  'Les aliments apportent suffisamment de sel pour couvrir nos besoins. Il n’est donc pas utile de saler les plats avant, pendant ou après la cuisson.',
  'Les desserts sucrés, les gâteaux, les viennoiseries, le chocolat doivent être consommés avec modération, car ils sont riches en graisses saturées et en sucres à faible index glycémique.',
  'Pour ajouter du goût, pensez plutôt aux épices et aux aromates.',
];

final List<Widget> imageSliders = imgList.map((item) => Container(
  child: Container(
    /*decoration: BoxDecoration(
      boxShadow: [disabledBox],
    ),*/
    margin: EdgeInsets.all(5.0),
    child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            Image.asset(item, fit: BoxFit.cover, width: 1000.0),
            //Image.network(item, fit: BoxFit.cover, width: 1000.0),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0),
                      //Colors.lightGreen,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                child: Text(
                  textList[imgList.indexOf(item)],
                  //'No. ${imgList.indexOf(item)} image.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        )
    ),
  ),
)).toList();

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double screenWidth, screenHeight;
  int _current = 0;

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

  Widget firstSectionTitle() {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: Wrap(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //spacing: screenWidth - 280, // gap between adjacent chips
        //runSpacing: 4.0, // gap between lines
        direction: Axis.horizontal, // main axis (rows or columns)
        children: <Widget>[
          Text(
            'Recommandations du jour',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget carouselWithIndicator() {
    return Column(
        children: [
          CarouselSlider(
            items: imageSliders,
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.map((url) {
              int index = imgList.indexOf(url);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                      ? Color.fromRGBO(0, 0, 0, 0.9)
                      : Color.fromRGBO(0, 0, 0, 0.4),
                ),
              );
            }).toList(),
          ),
        ]
    );
  }

  Widget secondSectionTitle() {
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
                        firstSectionTitle(),
                        carouselWithIndicator(),
                        secondSectionTitle(),
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
