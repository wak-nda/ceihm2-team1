import 'package:flutter/material.dart';

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
          fontSize: 18,
          fontWeight: FontWeight.w300,
          color: Colors.black,
        ),
      ),
    );
  }
}
