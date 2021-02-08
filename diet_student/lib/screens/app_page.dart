import 'package:diet_student/common/values.dart';
import 'package:diet_student/screens/consumption_page.dart';
import 'package:diet_student/screens/evolution_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fleva_icons/fleva_icons.dart';

import 'home_page.dart';
import 'profile_page.dart';
import 'consumption_page.dart';

class AppPage extends StatefulWidget {
  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {

  int _currentIndex = 0;
  List<Widget> _children = [
    HomePage(),
    ConsumptionPage(),
    EvolutionPage(),
    Profile()
  ];

  @override
  void initState() {
    super.initState();
  }

  void _onTabTapped(int index) {
    setState(() {
      //print(todayTickets);
      _currentIndex = index;
      _children = [
        HomePage(),
        ConsumptionPage(),
        EvolutionPage(),
        Profile()
      ];
      manualEntry = false;
      backScan = false;
      typeBarcode = false;
      scanNotFound = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
        title: Text(
          "dietStudent",
          style: TextStyle(
            fontFamily: 'Pacifico',
            color: Colors.white70,
            fontSize: 30,
          ),
        ),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _children,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Used to fix bug on screen
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FlevaIcons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesome5.hamburger),
            label: 'Consommation',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesome5.chart_line),
            label: 'Evolution',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesome5.user),
            label: 'Profil',
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white70,
        backgroundColor: Colors.lightGreen,
        onTap: _onTabTapped,
      ),
    );
  }
}
