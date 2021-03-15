import 'dart:convert';
import 'package:covid19/service/countryService.dart';
import 'package:covid19/model/countryModel.dart';
import 'package:covid19/model/world.dart';
import 'package:covid19/pages/country.dart';
import 'package:covid19/pages/rank.dart';
import 'package:covid19/service/globalCases.dart';
import 'package:covid19/widget/dash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String statTitle = 'Global Statistics';
  int currentBtn = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("COVID 19 Statistics"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 50),
            Text(
              "Click on Your Category",
              style: TextStyle(
                  fontSize: 20.0,
                  wordSpacing: 2.0,
                  fontWeight: FontWeight.bold),
            ),
            Center(
              child: ToggleSwitch(
                minWidth: 150.0,
                cornerRadius: 20.0,
                activeBgColor: Colors.indigo,
                inactiveBgColor: Colors.grey,
                activeFgColor: Colors.white,
                inactiveFgColor: Colors.white,
                initialLabelIndex: currentBtn,
                labels: ['Global', 'Per Country', 'Ranking'],
                onToggle: (index) async {
                  setState((){
                    currentBtn = index;
                    if (currentBtn == 1) {
                         Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Country()),
                        );
                    } else if (currentBtn == 2) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Ranking()));
                    } else {
                    }
                  });
                },
              ),
            ),

            FutureBuilder(
                future: GlobalCases.getWorldStats('world'),
                builder: (context, snapshot){
                  if(snapshot.data != null){
                    return Dash(snapshot.data);
                  }
                  return CircularProgressIndicator();
                }
            ),
          ],
        ),
      ),
    );
  }
}
