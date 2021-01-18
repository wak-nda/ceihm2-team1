import 'package:flutter/material.dart';

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
          fontSize: 18,
          fontWeight: FontWeight.w300,
          color: Colors.black,
        ),
      ),
    );
  }
}
