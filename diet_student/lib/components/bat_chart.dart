import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

// chart
class Pollution {
  String place;
  int year;
  int quantity;

  Pollution(this.year, this.place, this.quantity);
}

class BatChart extends StatefulWidget {
  final int proteins;
  final int lipids;
  final int glucides;

  @override
  _BatChartState createState() => _BatChartState(proteins, lipids, glucides);

  BatChart(this.proteins, this.lipids, this.glucides);
}

class _BatChartState extends State<BatChart>
    with SingleTickerProviderStateMixin {
  final int proteins;
  final int lipids;
  final int glucides;
  // chart
  List<charts.Series<Pollution, String>> _seriesData;

  _BatChartState(this.proteins, this.lipids, this.glucides);

  @override
  void initState() {
    super.initState();
    //perform
    _seriesData = List<charts.Series<Pollution, String>>();
    //chart
    var data1 = [
      new Pollution(1980, 'Matin', 30),
      new Pollution(1980, 'Midi', 40),
      new Pollution(1980, 'Soir', 10),
    ];
    var data2 = [
      new Pollution(1985, 'Matin', 100),
      new Pollution(1980, 'Midi', 150),
      new Pollution(1985, 'Soir', 80),
    ];
    var data3 = [
      new Pollution(1985, 'Matin', 200),
      new Pollution(1980, 'Midi', 300),
      new Pollution(1985, 'Soir', 180),
    ];
    
    _seriesData.add(
      charts.Series(
        domainFn: (Pollution pollution, _) => pollution.place,
        measureFn: (Pollution pollution, _) => pollution.quantity,
        id: '2017',
        data: data1,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Pollution pollution, _) =>
            //charts.ColorUtil.fromDartColor(Color(0xff990099)),
            charts.ColorUtil.fromDartColor(Colors.green),
      ),
    );

    _seriesData.add(
      charts.Series(
        domainFn: (Pollution pollution, _) => pollution.place,
        measureFn: (Pollution pollution, _) => pollution.quantity,
        id: '2018',
        data: data2,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Pollution pollution, _) =>
            charts.ColorUtil.fromDartColor(Colors.amber),
            //charts.ColorUtil.fromDartColor(Color(0xff109618)),
      ),
    );

    _seriesData.add(
      charts.Series(
        domainFn: (Pollution pollution, _) => pollution.place,
        measureFn: (Pollution pollution, _) => pollution.quantity,
        id: '2019',
        data: data3,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Pollution pollution, _) =>
            charts.ColorUtil.fromDartColor(Colors.blue),
            //charts.ColorUtil.fromDartColor(Color(0xffff9900)),
      ),
    );
  }

  @override
  void dispose() {
    // here
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Expanded(
        child: charts.BarChart(
          _seriesData,
          animate: true,
          barGroupingType: charts.BarGroupingType.grouped,
          //behaviors: [new charts.SeriesLegend()],
          animationDuration: Duration(seconds: 3),
        ),
      ),
    );
  }
}