import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {

  final List<String> caseList = <String>[
    'Based on Confirmed Cases',
    'Based on Recovered Cases',
    'Based on Death Cases'];

  String dropDownValue;


  @override
  void initState() {
    super.initState();
    dropDownValue = caseList[0];
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton <String> (
      value: dropDownValue,
        icon: const Icon(Icons.arrow_drop_down_circle_outlined),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: Colors.black),
        underline: Container(
          height: 2,
          color: Colors.blue,
        ),
        onChanged: (String newValue){
        setState(() {
          dropDownValue = newValue;
          print('Switch Drop $dropDownValue');
        });
        },
      items: caseList.map(
              (item) {
                return DropdownMenuItem(
                    value: item,
                    child: new Text(item),
                );
              },
      ).toList(),
    );
  }
}
