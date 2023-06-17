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
  // late Future futureWeather;
  late Future futureWeatherForecast;

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

    var getWeatherForecast = Center(
      child: FutureBuilder(
        future: futureWeatherForecast,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = jsonDecode(snapshot.data!.body);
            var locationName = data['location']['name'];
            var currentTemp = data['current']['temp_f'];
            var forecast = data['forecast']['forecastday'];
            var conditionText = data['current']['condition']['text'];
            var conditionIcon = data['current']['condition']['icon'];
            print(forecast);

            return Column(
              children: [
                Row(
                  children: [
                    Text(locationName),
                    SizedBox(
                      width: 20,
                    ),
                    Text(currentTemp.toString()),
                    Text(conditionText),
                    Image(
                      image: NetworkImage(conditionIcon),
                    ),
                  ],
                ),
                Column(
                  children: [
                    for (var i in forecast) Text(i['date'].toString()),
                    SizedBox(
                      width: 20,
                    ),
                    for (var i in forecast)
                      Text(i['day']['mintemp_f'].toString()),
                    SizedBox(
                      width: 20,
                    ),
                    for (var i in forecast)
                      Text(i['day']['maxtemp_f'].toString()),
                    SizedBox(
                      width: 20,
                    ),
                    for (var i in forecast)
                      Text(i['day']['condition']['text'].toString()),
                    for (var i in forecast)
                      Image(
                        image: NetworkImage(i['day']['condition']['icon']),
                      ),
                  ],
                ),
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
