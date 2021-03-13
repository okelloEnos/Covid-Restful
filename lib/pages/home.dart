import 'package:covid19/widget/dash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String statTitle = 'Load...';
  int currentBtn = 0;

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
            SizedBox(height: 150),
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
                onToggle: (index) {
                  setState(() {
                    currentBtn = index;

                    if (currentBtn == 1) {
                      statTitle = 'Per Country Stats';
                      Navigator.of(context).pushReplacementNamed('country');
                    } else if(currentBtn == 2){
                      statTitle = 'Cases Ranks Per Country';
                      Navigator.of(context).pushReplacementNamed('rank');
                    }
                      else {
                        statTitle = 'Global Stats';
                      }
                  });
                },
              ),
            ),
            SizedBox(height: 40),
            Text(
              "$statTitle",
              style: TextStyle(
                  fontSize: 20.0, wordSpacing: 2.0, fontWeight: FontWeight.bold),
            ),
            Dash(),
          ],
        ),
      ),
    );
  }
}
