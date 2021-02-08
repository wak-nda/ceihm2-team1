import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

// chart
class Task {
  String task;
  double taskvalue;
  Color colorval;

  Task(this.task, this.taskvalue, this.colorval);
}

class PieChart extends StatefulWidget {
  final int proteins;
  final int lipids;
  final int glucides;

  @override
  _PieChartState createState() => _PieChartState(proteins, lipids, glucides);

  PieChart(this.proteins, this.lipids, this.glucides);
}

class _PieChartState extends State<PieChart>
    with SingleTickerProviderStateMixin {
  final int proteins;
  final int lipids;
  final int glucides;
  // chart
  List<charts.Series<Task, String>> _seriesPieData;

  _PieChartState(this.proteins, this.lipids, this.glucides);

  @override
  void initState() {
    super.initState();
    //perform
    //chart
    _seriesPieData = List<charts.Series<Task, String>>();
    var piedata = [
      new Task('Protéines', proteins.toDouble(), Color(0xff3366cc)),
      //new Task('Lipides', 8.3, Color(0xff990099)),
      new Task('Glucides', glucides.toDouble(), Color(0xff109618)),
      new Task('Lipides', lipids.toDouble(), Color(0xfffdbe19)),
      //new Task('Sel', 19.2, Color(0xffff9900)),
      //new Task('Other', 10.3, Color(0xffdc3912)),
    ];
    _seriesPieData.add(
      charts.Series(
        domainFn: (Task task, _) => task.task,
        measureFn: (Task task, _) => task.taskvalue,
        colorFn: (Task task, _) =>
            charts.ColorUtil.fromDartColor(task.colorval),
        id: 'macronutriments',
        data: piedata,
        labelAccessorFn: (Task row, _) => '${row.taskvalue}',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Expanded(
        child: charts.PieChart(
            _seriesPieData,
            animate: true,
            animationDuration:
            Duration(seconds: 1),
            behaviors: [
              new charts.DatumLegend(
                position: charts
                    .BehaviorPosition
                    .top,
                outsideJustification: charts
                    .OutsideJustification
                    .endDrawArea,
                horizontalFirst: true,
                desiredMaxRows: 2,
                cellPadding:
                new EdgeInsets.only(
                    right: 4.0,
                    bottom: 4.0),
                entryTextStyle: charts
                    .TextStyleSpec(
                    color: charts
                        .MaterialPalette
                        .purple
                        .shadeDefault,
                    //fontFamily: 'Georgia',
                    fontSize: 15),
              )
            ],
            defaultRenderer: new charts
                .ArcRendererConfig(
                arcWidth: 100,
                arcRendererDecorators: [
                  new charts
                      .ArcLabelDecorator(
                      labelPosition: charts
                          .ArcLabelPosition
                          .inside)
                ])),
      ),
    );
  }

  @override
  void dispose() {
    // here
    super.dispose();
  }
}