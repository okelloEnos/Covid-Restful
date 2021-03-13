import 'package:covid19/pages/country.dart';
import 'package:covid19/pages/home.dart';
import 'package:covid19/pages/rank.dart';
import 'package:flutter/material.dart';
import 'package:covid19/pages/home.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
    routes: {
      'home' : (context) => Home(),
      'country': (context) => Country(),
      'rank': (context) => Ranking(),
    },
    theme: new ThemeData(
      primaryColor: Color(0xFFff2b4a),
      primaryColorLight: Color(0xFFff66b0),
      primaryColorDark: Color(0xFFff0203),
      accentColor:  Color(0xFFFF1493),
    ),
  ));
}