import 'package:provider/provider.dart';
import '../main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';
import '../classes/classes.dart';

class WeatherPage extends StatefulWidget {
  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late Future futureWeather;
  late Future futureWeatherForecast;

  @override
  void initState() {
    super.initState();
    futureWeather = getCurrentWeather();
    futureWeatherForecast = getWeatherForecast();
  }

  @override
  Widget build(BuildContext context) {
    // var appState = context.watch<MyAppState>();
    // var theme = Theme.of(context);

    var getCurrentWeather = Center(
      child: FutureBuilder(
        future: futureWeather,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SizedBox(width: 400, child: Text(snapshot.data!.body));
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    );

    var getWeatherForecast = Center(
      child: FutureBuilder(
        future: futureWeatherForecast,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SizedBox(width: 400, child: Text(snapshot.data!.body));
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    );

    var weatherLayout = Column(
      children: [
        getCurrentWeather,
        SizedBox(
          height: 40,
        ),
        getWeatherForecast
      ],
    );

    return Scaffold(
      body: ListView(children: [
        Container(height: 200, color: Colors.deepPurple),
        Expanded(
            // Make better use of wide windows with a grid.
            child: weatherLayout),
      ]),
    );
  }
}
