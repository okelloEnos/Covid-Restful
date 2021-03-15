import 'package:covid19/widget/dropDown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covid19/service/countryService.dart';

class Ranking extends StatefulWidget {
  @override
  _RankingState createState() => _RankingState();
}

class _RankingState extends State<Ranking> {
  var rankList = ['Kenya', 'Uganda', 'Tanzania', 'Kazhakastan', 'Sudan'];
  var rankingList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CountryService.getCountries().then((list) {
      list.forEach((country) {
        setState(() {
        rankingList.add(country.totalCasesText);
        });
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Rank # ${rankingList.toString()}');

    return Scaffold(
      appBar: AppBar(
        title: Text('Case Ranking'),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back_sharp), onPressed: (){
          Navigator.pop(context, false);
        }),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            DropDown(),
            SizedBox(height: 20.0),
            ListView.builder(
              scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, position) {
                  return Container(
                    height: 50.0,
                    child: Card(
                      color: Colors.grey,
                      child: Text(rankList[position]),
                    ),
                  );
                },
                itemCount: rankList.length)
          ],
        ),
      ),
    );
  }
}
