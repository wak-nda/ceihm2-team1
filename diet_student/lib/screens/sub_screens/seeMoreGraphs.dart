import 'package:diet_student/components/bat_chart.dart';
import 'package:diet_student/components/circularButton.dart';
import 'package:diet_student/components/line_chart.dart';
import 'package:diet_student/components/pie_chart.dart';
import 'package:diet_student/models/food_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;

class SeeMoreGraphs extends StatefulWidget {
  final int protein;
  final int glucide;
  final int lipid;
  //final List<FoodModel> foods;

  const SeeMoreGraphs(
      {Key key,
      this.protein,
      this.glucide,
      this.lipid,
      /*this.foods*/})
      : super(key: key);

  @override
  _SeeMoreGraphsState createState() =>
      _SeeMoreGraphsState(protein, glucide, lipid/*, foods*/);
}

class _SeeMoreGraphsState extends State<SeeMoreGraphs>
    with SingleTickerProviderStateMixin {
  //DateTime _chosenDate = new DateTime.now();
  final int protein;
  final int glucide;
  final int lipid;
  /*final List<FoodModel> foods;*/

  _SeeMoreGraphsState(
      this.protein, this.glucide, this.lipid/*, this.foods*/);

  AnimationController animationController;
  Animation degOneTranslationAnimation,
      degTwoTranslationAnimation,
      degThreeTranslationAnimation;
  Animation rotationAnimation;

  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  //Future<Today> today;
  //Repository _repository = new Repository();

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    degOneTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.2), weight: 75.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.2, end: 1.0), weight: 25.0),
    ]).animate(animationController);
    degTwoTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.4), weight: 55.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.4, end: 1.0), weight: 45.0),
    ]).animate(animationController);
    degThreeTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.75), weight: 35.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.75, end: 1.0), weight: 65.0),
    ]).animate(animationController);
    rotationAnimation = Tween<double>(begin: 180.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));
    animationController.addListener(() {
      setState(() {});
    });

    //today = _repository.fetchTodayInHistory(
    //    _chosenDate.month.toString(), _chosenDate.day.toString());
  }

  /*_chooseDate() async {
    var _newlyChosenDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year, 1, 1),
      lastDate: DateTime(DateTime.now().year, 12, 31),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.dark(),
          child: child,
        );
      },
    );
    if (_newlyChosenDate != _chosenDate) {
      setState(() {
        _chosenDate = _newlyChosenDate;
        today = null;
        today = _repository.fetchTodayInHistory(
            _chosenDate.month.toString(), _chosenDate.day.toString());
      });
    }
  }*/

  /*
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now().add(Duration(days: 7));

  Future displayDateRangePicker(BuildContext context) async {
    final List<DateTime> picked = await DateRagePicker.showDatePicker(
        context: context,
        initialFirstDate: _startDate,
        initialLastDate: _endDate,
        firstDate: new DateTime(DateTime.now().year - 50),
        lastDate: new DateTime(DateTime.now().year + 50));
    if (picked != null && picked.length == 2) {
      setState(() {
        _startDate = picked[0];
        _endDate = picked[1];
      });
    }
  }*/

  @override
  Widget build(BuildContext context) {
    //var divHeight = MediaQuery.of(context).size.height;
    //var divWidth = MediaQuery.of(context).size.width;

    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              child: Center(
                child: Column(
                  children: <Widget>[
                    if (protein != 0 || glucide != 0 || lipid != 0) ...[
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Apports en macronutriments',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      PieChart(protein, glucide, lipid),
                      Text(
                        'Evolution au cours de la journée',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      LineChart(protein, glucide, lipid),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Périodes à retenir',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      BatChart(protein, glucide, lipid),
                    ] else
                      Text(
                        "Aucune donnée enregistrée aujourd'hui",
                        style: TextStyle(
                          fontFamily: 'Pacifico',
                          color: Colors.black,
                          fontSize: 24,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
