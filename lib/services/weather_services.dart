import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/models/weather_model.dart';

class WeatherServices {
  String baseurl = 'http://api.weatherapi.com/v1';
  String apikey = '5b0089241104430aba425332232506';
  Future<WeatherModel> getWeather({required String cityname}) async {
    Uri url = Uri.parse('$baseurl/current.json?key=$apikey&q=$cityname');
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(
        response.body); // to convert the return string valuses to json data
        
    WeatherModel weather = WeatherModel.fromJson(data);
    return weather;
  }
}
