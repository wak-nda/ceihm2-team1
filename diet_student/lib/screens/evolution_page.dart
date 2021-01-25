import 'package:flutter/material.dart';
import '../common/globals.dart' as globals;

class EvolutionPage extends StatefulWidget {
  @override
  _EvolutionPageState createState() => _EvolutionPageState();
}

class _EvolutionPageState extends State<EvolutionPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "Evolution",
        style: TextStyle(
          fontSize: globals.textSize,
          fontWeight: FontWeight.w300,
          color: Colors.black,
        ),
      ),
    );
  }
}
