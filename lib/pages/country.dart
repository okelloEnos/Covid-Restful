import 'package:covid19/model/countryModel.dart';
import 'package:covid19/widget/dash.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:textfield_search/textfield_search.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

class Country extends StatefulWidget {
  @override
  _CountryState createState() => _CountryState();
}

class _CountryState extends State<Country> {
  var labelled = 'Search Country';
  var countryList = ['Kenya', 'Uganda', 'Tanzania', 'Kazhakastan'];
  var Country = 'Congo';
  var completeController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Country = completeController.text;

    return Scaffold(
      appBar: AppBar(
        title: Text('$Country Covid Stats'),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back_sharp), onPressed: (){
          Navigator.pop(context, false);
        }),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AutoCompleteTextField(
                controller: completeController,
                  itemSubmitted: (item){
                  completeController.text = item;
                  setState(() {
                    print('Switch vale ?? $item');
                  });

                  },
                  clearOnSubmit: false,
                  suggestions: countryList,
                  style: TextStyle(color:  Colors.black, fontSize:  16.0),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    )
                  ),
                  itemBuilder: (context, item){
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
                  itemSorter: (a, b){
                  return a.compareTo(b);
                  },
                  itemFilter: (item, query){
                  return item.toLowerCase().startsWith(query.toLowerCase());
                  }),
            ),
            // SearchBar <CountryName> (onSearch: onSearch,
            //     onItemFound: (CountryName name, int index){
            //   return ListTile(
            //     title: Text(name.name),
            //     subtitle: Text(name.code),
            //   );
            //     }
            // ),
            Dash(),
          ],
        ),
      ),
    );
  }

  Future <List> remote() async{
    await Future.delayed(Duration(milliseconds: 1000));
    return countryList;
  }
}

