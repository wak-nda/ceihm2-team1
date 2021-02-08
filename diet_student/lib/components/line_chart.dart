import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Sales {
  int yearval;
  int salesval;

  Sales(this.yearval, this.salesval);
}

class LineChart extends StatefulWidget {
  final int proteins;
  final int lipids;
  final int glucides;

  @override
  _LineChartState createState() => _LineChartState(proteins, lipids, glucides);

  LineChart(this.proteins, this.lipids, this.glucides);
}

class _LineChartState extends State<LineChart>
    with SingleTickerProviderStateMixin {
  final int proteins;
  final int lipids;
  final int glucides;
  // chart
  List<charts.Series<Sales, int>> _seriesLineData;

  _LineChartState(this.proteins, this.lipids, this.glucides);

  @override
  void initState() {
    super.initState();
    //perform
    //chart
    _seriesLineData = List<charts.Series<Sales, int>>();

    var linesalesdata = [
      new Sales(0, 45),
      new Sales(1, 56),
      new Sales(2, 55),
      new Sales(3, 60),
      new Sales(4, 61),
      new Sales(5, 70),
    ];
    var linesalesdata1 = [
      new Sales(0, 35),
      new Sales(1, 46),
      new Sales(2, 45),
      new Sales(3, 50),
      new Sales(4, 51),
      new Sales(5, 60),
    ];

    var linesalesdata2 = [
      new Sales(0, 20),
      new Sales(1, 24),
      new Sales(2, 25),
      new Sales(3, 40),
      new Sales(4, 45),
      new Sales(5, 60),
    ];

    _seriesLineData.add(
      charts.Series(
        //colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff990099)),
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Colors.green),
        id: 'food',
        data: linesalesdata,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        //colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff109618)),
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Colors.amber),
        id: 'food',
        data: linesalesdata1,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        //colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xffff9900)),
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Colors.blue),
        id: 'food',
        data: linesalesdata2,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Expanded(
        child: charts.LineChart(
            _seriesLineData,
            defaultRenderer: new charts.LineRendererConfig(
                includeArea: true, stacked: true),
            animate: true,
            animationDuration: Duration(seconds: 2),
            behaviors: [
              new charts.ChartTitle('Heures de la journée',
                  behaviorPosition: charts.BehaviorPosition.bottom,
                  titleOutsideJustification:charts.OutsideJustification.middleDrawArea),
              new charts.ChartTitle('Quantité (g)',
                  behaviorPosition: charts.BehaviorPosition.start,
                  titleOutsideJustification: charts.OutsideJustification.middleDrawArea),
              new charts.ChartTitle('Macronutriments',
                behaviorPosition: charts.BehaviorPosition.end,
                titleOutsideJustification:charts.OutsideJustification.middleDrawArea,
              )
            ]
        ),
      ),
    );
  }

  @override
  void dispose() {
    // here
    super.dispose();
  }
}