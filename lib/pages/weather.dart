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
      return Container(
        color: Colors.deepOrange,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Image(
                  image: NetworkImage(
                      "http:${data['current']['condition']['icon']}"),
                ),
                Text(data['current']['condition']['text'],
                    style: TextStyle(color: Colors.white)),
              ],
            ),
            Text(data['location']['name'],
                style: TextStyle(color: Colors.white)),
            Text("${data['current']['temp_f'].toString()} F",
                style: TextStyle(color: Colors.white)),
          ],
        ),
      );
    }

    weatherForecastWidget(data, i) {
      var forecast = data['forecast']['forecastday'];

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Image(
                image: NetworkImage(
                    "http:${forecast[i]['day']['condition']['icon']}"),
              ),
              Text(forecast[i]['day']['condition']['text'].toString()),
            ],
          ),
          Text("${forecast[i]['day']['mintemp_f'].toString()} F"),
          Text("${forecast[i]['day']['maxtemp_f'].toString()} F"),
          Text(DateFormat.MMMd().format(DateTime.parse(forecast[i]['date']))),
          SizedBox(
            height: 120,
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
