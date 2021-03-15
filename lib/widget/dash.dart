import 'package:covid19/model/world.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dash extends StatefulWidget {
  final World receivedStats;

  const Dash(this.receivedStats);

  @override
  _DashState createState() => _DashState();
}

class _DashState extends State<Dash> {
  World stats;

  @override
  void initState() {
    // TODO: implement initState
    stats = widget.receivedStats;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
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
                  Text('New Confirmed Cases : ${stats.newCasesText.isEmpty? 'Not Provided' : stats.newCasesText}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                  ),),
                  Text('Total Confirmed Cases : ${stats.totalCasesText.isEmpty ? 'Not Provided' : stats.totalCasesText}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                    ),),
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
                  Text('New Recovered Cases : Not Provided', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                  ),),
                  Text('Total Recovered Cases : ${stats.totalRecoveredText.isEmpty ? 'Not Provided' : stats.totalRecoveredText}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                    ),),
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
                  Text('New Death Cases : ${stats.newDeathsText.isEmpty ? 'Not Provided' : stats.newDeathsText}',
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                  ),),
                  Text('Total Death Cases : ${stats.totalDeathsText.isEmpty ? 'Not Provided' : stats.totalDeathsText}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                    ),),
                ],
              ),
            ),
          ),
        ),
      ],
    );

  }
}
