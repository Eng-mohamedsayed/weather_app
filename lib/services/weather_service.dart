import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/models/weather_model.dart';

class WeatherServices {
  String baseUrl = 'https://www.metaweather.com';

  Future<int> getCityID({required String cityName}) async {
    Uri url = Uri.parse('$baseUrl/api/location/search/?query=$cityName');

    http.Response response = await http.get(url);

    List<dynamic> data = jsonDecode(response.body);

    int cityID = data[0]['woeid'];

    return cityID;
  }

  Future<WeatherModel?> getWeather({required String cityName}) async {
     WeatherModel? weatherModel;
 try{
       int cityID = await getCityID(cityName: cityName);

      Uri url = Uri.parse('$baseUrl/api/location/$cityID/');

      http.Response response = await http.get(url);

      Map<String, dynamic> jsonData = jsonDecode(response.body);

      Map<String, dynamic> data = jsonData['consolidated_weather'][0];

      weatherModel = WeatherModel.fromJson(data);

 }catch (e){
   print(e.toString());
 }

    return weatherModel;
  }
}
