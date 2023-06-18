import 'package:intl/intl.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import '../classes/classes.dart';

class WeatherPage extends StatefulWidget {
  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  // late Future futureWeather;
  late Future futureWeatherForecast;
  var moose = <Widget>[];

  @override
  void initState() {
    super.initState();
    // futureWeather = getCurrentWeather();
    futureWeatherForecast = getWeatherForecast();
  }

  @override
  Widget build(BuildContext context) {
    // var appState = context.watch<MyAppState>();
    // var theme = Theme.of(context);

    currentWeatherWidget(data) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(data['location']['name']),
          Text(data['current']['temp_f'].toString()),
          Text(data['current']['condition']['text']),
          Text(DateFormat.yMMMd().format(DateTime.now())),
          Image(
            image: NetworkImage("http:${data['current']['condition']['icon']}"),
          ),
        ],
      );
    }

    weatherForecastWidget(data, i) {
      print(data['forecast']['forecastday'][i]['day']);
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(data['forecast']['forecastday'][i]['date']),
          Text(data['forecast']['forecastday'][i]['day']['mintemp_f']
              .toString()),
          Text(data['forecast']['forecastday'][i]['day']['maxtemp_f']
              .toString()),
          Text(data['forecast']['forecastday'][i]['day']['condition']['text']
              .toString()),
          Image(
            image: NetworkImage(
                "http:${data['forecast']['forecastday'][i]['day']['condition']['icon']}"),
          ),
        ],
      );
    }

    var getWeatherForecast = Center(
      child: FutureBuilder(
        future: futureWeatherForecast,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = jsonDecode(snapshot.data!.body);

            return Column(
              children: [
                currentWeatherWidget(data),
                for (var i = 0; i < data['forecast']['forecastday'].length; i++)
                  weatherForecastWidget(data, i),
              ],
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    );

    return Scaffold(
      body: ListView(children: [
        getWeatherForecast,
      ]),
    );
  }
}
