import 'package:diet_student/mocks/food_mocks.dart';
import 'package:diet_student/models/food_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SeeMoreMeals extends StatefulWidget {

  const SeeMoreMeals(
      {Key key, })
      : super(key: key);

  @override
  _SeeMoreMealsState createState() =>
      _SeeMoreMealsState();
}

class _SeeMoreMealsState extends State<SeeMoreMeals>
    with SingleTickerProviderStateMixin {
  double screenWidth, screenHeight;

  List<FoodModel> _getFoods() {
    return FOOD_MOCKS
        .map((model) => FoodModel.fromMap(model))
        .toList();
  }

  Container latestMeals() {
    List<FoodModel> foods = _getFoods();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.0),
      decoration: BoxDecoration(
        //color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: <Widget>[
          for (FoodModel food in foods)
            Column(
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
                          text: food.name + '\n',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            height: 1.5,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Calories : ' +
                                  food.kcal.toString() +
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
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Container(
      //margin: EdgeInsets.only(top: 10),
      height: screenHeight - 222,
      width: screenWidth,
      // color: Colors.blue,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              latestMeals(),
            ],
          ),
        ),
      ),
    );
  }
}
