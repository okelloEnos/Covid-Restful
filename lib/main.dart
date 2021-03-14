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
      primaryColor: Color(0xff939090),
      primaryColorLight: Color(0xff939090),
      primaryColorDark: Color(0xff939090),
      accentColor:  Color(0xFF090909),
    ),
  ));
}