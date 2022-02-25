import 'package:flutter/cupertino.dart';
import 'package:weather/main.dart';
import 'package:weather/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weatherData;

  String? _cityName;

  set weatherData(WeatherModel? weather) {
    _weatherData = weather;
    notifyListeners();
  }

  WeatherModel? get weatherData => _weatherData;

  set cityName(String? city) {
    _cityName = city;
    notifyListeners();
  }

  String? get cityName => _cityName;
}
