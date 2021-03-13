import 'package:covid19/widget/dash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:textfield_search/textfield_search.dart';

class Country extends StatefulWidget {
  @override
  _CountryState createState() => _CountryState();
}

class _CountryState extends State<Country> {

  static const label = 'Search Country';
  static const countryList = ['Kenya', 'Uganda', 'Tanzania', 'Kazhakastan'];

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kenya Covid Stats'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget> [
            TextFieldSearch(initialList: countryList, label: label, controller: controller),
            Dash(),
          ],
        ),
      ),
    );
  }
}
