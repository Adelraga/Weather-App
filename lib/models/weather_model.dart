import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  double maxTemp;
  double minTemp;
  String weatherStateName;

  WeatherModel(
      {required this.date,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName});

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['current'];
    print(data);
    return WeatherModel(
        date:  jsonData['last_updated'],
        maxTemp: jsonData['temp_c'],
        minTemp: jsonData['temp_f'],
        weatherStateName: jsonData['condition']['text']);
  }
  
  @override
  String toString() {
    return ' mintemp = $minTemp  maxtemp= $maxTemp date = $date weatherStateName=$weatherStateName ';
  }
  String getImage(){
    if(weatherStateName=='Thunderstorm'||weatherStateName=='Thunder')
    {
      return 'assets/images/thunderstorm.png';

    }
    else if(weatherStateName=='Sleet'||weatherStateName=='Snow'||weatherStateName=='Hail'){
      return 'assets/images/snow.png';
    }
    else if(weatherStateName=='Clear'||weatherStateName=='Light Cloud'){
      return 'assets/images/clear.png';
    }
    else if(weatherStateName=='Heavy Cloud'){
            return 'assets/images/cloudy.png';

    }
    else if(weatherStateName=='Light Rain'||weatherStateName=='Heavy Rain'||weatherStateName=='Showers')
    {
                  return 'assets/images/rainy.png';

    }
    else{
            return 'assets/images/clear.png';

    }

  }
  MaterialColor getThemeColor(){
    if(weatherStateName=='Thunderstorm'||weatherStateName=='Thunder')
    {
      return Colors.orange;

    }
    else if(weatherStateName=='Sleet'||weatherStateName=='Snow'||weatherStateName=='Hail'){
      return Colors.blue;
    }
    else if(weatherStateName=='Clear'||weatherStateName=='Light Cloud'){
      return Colors.orange;
    }
    else if(weatherStateName=='Heavy Cloud'){
            return Colors.blueGrey;

    }
    else if(weatherStateName=='Light Rain'||weatherStateName=='Heavy Rain'||weatherStateName=='Showers')
    {
                  return Colors.blue;

    }
    else{
            return Colors.orange;

    }

  }
}
