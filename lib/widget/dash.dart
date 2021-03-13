import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dash extends StatefulWidget {
  @override
  _DashState createState() => _DashState();
}

class _DashState extends State<Dash> {
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
    );

  }
}
