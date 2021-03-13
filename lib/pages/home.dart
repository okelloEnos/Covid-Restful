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
                labels: ['Global', 'Per Country'],
                onToggle: (index) {
                  setState(() {
                    currentBtn = index;

                    if (currentBtn == 1) {
                      statTitle = 'Per Country Stats';
                    } else {
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
            SizedBox(height: 30.0),
            Container(
              width: 300.0,
              height: 100.0,
              child: Card(
                color: Colors.amber,
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('Confirmed Cases', style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),),
                      Text('new = 56'),
                      Text('total = 600'),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              width: 300.0,
              height: 100.0,
              child: Card(
                color: Colors.green,
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('Recovered Cases', style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),),
                      Text('new = 30'),
                      Text('total = 234'),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              width: 300.0,
              height: 100.0,
              child: Card(
                color: Colors.red,
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('Death Cases', style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),),
                      Text('new = 13'),
                      Text('total = 174'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
