import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/providers/weather_provider.dart';
import 'package:weather/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  String? cityName;

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search City'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              onChanged: (data){
                cityName = data;
              },
              onSubmitted: (data) async {
                cityName = data;
                WeatherServices weatherServices = WeatherServices();
                WeatherModel? weatherModel =
                    await weatherServices.getWeather(cityName: cityName!);
                Provider.of<WeatherProvider>(context, listen: false).cityName =
                    data;

                Provider.of<WeatherProvider>(context, listen: false)
                    .weatherData = weatherModel;
                Navigator.pop(context);
              },
              decoration:  InputDecoration(
                  prefixIcon: InkWell(
                    onTap: ()async{  
                    cityName = cityName;
                WeatherServices weatherServices = WeatherServices();
                WeatherModel? weatherModel =
                    await weatherServices.getWeather(cityName: cityName!);
                Provider.of<WeatherProvider>(context, listen: false).cityName =
                    cityName;

                Provider.of<WeatherProvider>(context, listen: false)
                    .weatherData = weatherModel;
                Navigator.pop(context);
                },
                 child:const Icon(Icons.search)),
                  label: const Text('Search'),
                  border: const OutlineInputBorder(),
                  hintText: 'Enter a City'),
            ),
          ),
        ));
  }
}
