import 'package:covid19/model/world.dart';
import 'package:http/http.dart' as http;
class GlobalCases{
  static World retrievedStats;
  
  static Future <World> getWorldStats(String region) async{
    print('Type : $region');
    try {
      var statsUrl = Uri.http('covid-19.dataflowkit.com', '/v1/$region');
      final response = await http.get(statsUrl);
      if(response.statusCode == 200){
        retrievedStats = worldFromJson(response.body);
        return retrievedStats;
      }
      else {
        return retrievedStats;
      }
    }
    catch (e) {
      throw Exception('Error : $e');
    }
  }

}