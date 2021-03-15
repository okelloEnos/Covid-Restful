import 'package:covid19/service/countryService.dart';
import 'package:covid19/service/globalCases.dart';
import 'package:covid19/widget/dash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

class Country extends StatefulWidget {
  @override
  _CountryState createState() => _CountryState();
}

class _CountryState extends State<Country> {
  var labelled = 'Search Country';
  var countryList = [];
  var Country = 'Congo';
  var completeController = new TextEditingController();
  bool _loading = true;
  bool checker = false;

  @override
  void initState() {
    super.initState();
    CountryService.getCountries().then((list) async{
      list.forEach((country) {
        countryList.add(country.countryText);
      });
    });
    _loading = true;
  }

  @override
  Widget build(BuildContext context) {
    Country = completeController.text;
    var list = countryList;
    return Scaffold(
      appBar: AppBar(
        title: Text('$Country COVID Stats'),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back_sharp), onPressed: () {
          Navigator.pop(context, false);
        }),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AutoCompleteTextField(
                onFocusChanged: (tru){
                  if (tru){
                    setState(() {
                      _loading = true;
                    });

                  }
                },
                  controller: completeController,
                  itemSubmitted: (item) {
                    completeController.text = item;
                    setState(() {
                      _loading = false;
                    });
                  },
                  clearOnSubmit: false,
                  suggestions: list,
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                  decoration: InputDecoration(
                      hintText: 'Search Country',
                      labelText: 'Countries',
                      icon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      )
                  ),
                  itemBuilder: (context, item) {
                    return Container(
                      padding: EdgeInsets.all(20.0),
                      child: Row(
                        children: <Widget>[
                          Text(item,
                            style: TextStyle(color: Colors.black),)
                        ],
                      ),
                    );
                  },
                  itemSorter: (a, b) {
                    return a.compareTo(b);
                  },
                  itemFilter: (item, query) {
                    checker = (item == null);
                    if(checker) {
                      return false;
                    }
                    else{
                      return item.toLowerCase().startsWith(query.toLowerCase());
                    }

                  }),
            ),
            _loading ? Text('Search COVID Stats for specific Countries') :   FutureBuilder(
                future: GlobalCases.getWorldStats('$Country'),
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    return Dash(snapshot.data);
                  }
                  return CircularProgressIndicator();
                }),
          ],
        ),),);
  }
}

