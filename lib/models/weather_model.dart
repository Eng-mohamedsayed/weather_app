import 'package:flutter/material.dart';

class WeatherModel {
  String weatherStateName;
  DateTime created;
  double minTemp;
  double maxTemp;
  double theTemp;
  WeatherModel({
    required this.weatherStateName,
    required this.created,
    required this.minTemp,
    required this.maxTemp,
    required this.theTemp,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      weatherStateName: json['weather_state_name'],
      created: DateTime.parse(json['created']),
      minTemp: json['min_temp'],
      maxTemp: json['max_temp'],
      theTemp: json['the_temp'],
    );
  }

  String getImage() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return 'assets/images/clear.png';
    } else if (weatherStateName == 'Snow' ||
        weatherStateName == 'Hail' ||
        weatherStateName == 'Sleet') {
      return 'assets/images/snow.png';
    } else if (weatherStateName == 'Heavy Cloud') {
      return 'assets/images/cloudy.png';
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Showers' ||
        weatherStateName == 'Heavy Rain	') {
      return 'assets/images/rainy.png';
    } else if (weatherStateName == 'Thunderstorm' ||
        weatherStateName == 'Thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemeColor() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return Colors.orange;
    } else if (weatherStateName == 'Snow' ||
        weatherStateName == 'Hail' ||
        weatherStateName == 'Sleet') {
      return Colors.blue;
    } else if (weatherStateName == 'Heavy Cloud') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Showers' ||
        weatherStateName == 'Heavy Rain	') {
      return Colors.blue;
    } else if (weatherStateName == 'Thunderstorm') {
      return Colors.red;
    } else {
      return Colors.red;
    }
  }
}
