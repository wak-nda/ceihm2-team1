import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();

}

final String _fullName ="Sandra Olit";
final String _objectiveTitle= "Objectif Actuel:";
final String _activitiesTitle= "Activités Physiques:";
final String _objective= "Perdre 10 Kg tout en gagnant en masse musculaire";
final String _activities = "`Musculation, 4x par semaine, séance de 1h30";

Widget _buildProfileImage(){
  return Center(
    child: Container(
      margin: EdgeInsets.only(top: 25.0),
      width: 140.0,
      height: 140.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/user1.jpg'),
          fit:  BoxFit.cover
        ),
        borderRadius: BorderRadius.circular(80.0),
        border: Border.all(
          color: Colors.black,
          width: 5.0,
        )
      ),
    ),
  );
}

Widget _buildFullName(){
  TextStyle _nameTextStyle = TextStyle(
    fontFamily: 'Roboto',
    color: Colors.black,
    fontSize: 28.0,
    fontWeight: FontWeight.w300,
  );
  return Text(
    _fullName,
    style: _nameTextStyle,
  );
}
Widget _buildSeparator(Size screenSize){
  return Container(
    width: screenSize.width /1.6 ,
    height: 2.0,
    color: Colors.black54,
    margin: EdgeInsets.only(top: 25.0),
  );
}
Widget _buildInvisibleSeparator(Size screenSize){
  return Container(
    width: screenSize.width /1.6 ,
    height: 2.0,
    color: Colors.white70,
    margin: EdgeInsets.only(top: 25.0),
  );
}


Widget _buildContentText(String contentText){
  TextStyle _contentTextStyle = TextStyle(
    fontFamily: 'Spectral',
    color: Color(0xFF799497),
    fontSize: 15.0,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,

  );
  return Text(
    contentText,
    style: _contentTextStyle,
  );
}

Widget _buildSectionTitle(String title){
  TextStyle _titleTextStyle = TextStyle(
    fontFamily: 'Spectral',
    color: Colors.black,
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
  );
  return Padding(
    padding: const EdgeInsets.only(top: 25.0, bottom: 10.0),
    child: Text(title ,
    style: _titleTextStyle ),
  );
}

Widget _buildEditButton(){
  return Center(
    child: RaisedButton(

      onPressed:null ,
      child: Text('Modifier'),
      color: Colors.lightGreen,
    ),
  );

}

class _ProfilePageState extends State<Profile> {
  @override

  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        _buildProfileImage(),
        _buildFullName(),
        _buildSeparator(screenSize),
        _buildSectionTitle(_objectiveTitle),
        _buildContentText(_objective),
        _buildSeparator(screenSize),
        _buildSectionTitle(_activitiesTitle),
        _buildContentText(_activities),
        _buildInvisibleSeparator(screenSize),
        _buildEditButton(),
      ]
      // Text(
      //   "Profile",
      //   style: TextStyle(
      //     fontSize: globals.textSize,
      //     fontWeight: FontWeight.w300,
      //     color: Colors.black,
      //   ),
      // ),
    );
  }
}
