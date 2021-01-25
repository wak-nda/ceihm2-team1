import 'package:flutter/material.dart';
import '../common/globals.dart' as globals;

class ConsumptionPage extends StatefulWidget {
  @override
  _ConsumptionPageState createState() => _ConsumptionPageState();
}

class _ConsumptionPageState extends State<ConsumptionPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "Consommation",
        style: TextStyle(
          fontSize: globals.textSize,
          fontWeight: FontWeight.w300,
          color: Colors.black,
        ),
      ),
    );
  }
}
