import 'package:covid19/model/countryModel.dart';
import 'package:http/http.dart' as http;
class CountryService{

  static Future<List<CountryName>> getCountries() async {
    try {
      var urlCountry = Uri.https('covid-19.dataflowkit.com', '/v1');
      final response = await http.get(urlCountry);
      if(200 == response.statusCode){
        final List<CountryName> countries = countryNameFromJson(response.body);
        print('Switch :: ${response.statusCode}');
        return countries;
      }
      else{
        print('Switch else :: ${response.statusCode}');
        return List<CountryName>();
      }
    }
    catch(e){
      print('Switch catch:: $e}');
      return List<CountryName>();
    }
  }
}