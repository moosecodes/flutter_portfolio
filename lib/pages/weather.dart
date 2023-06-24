import 'package:intl/intl.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import '../classes/utils.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WeatherPage extends StatefulWidget {
  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late Future futureWeatherApi;

  @override
  void initState() {
    super.initState();
    futureWeatherApi = getWeatherForecast(zip: '90004');
  }

  @override
  Widget build(BuildContext context) {
    // var appState = context.watch<MyAppState>();
    var theme = Theme.of(context);

    currentWeatherWidget(data) {
      return Card(
        color: theme.colorScheme.primary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Current',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Image(
              image:
                  NetworkImage("https:${data['current']['condition']['icon']}"),
            ),
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  speed: Duration(milliseconds: 150),
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  "${data['current']['temp_f'].truncate().toString()} F °",
                ),
              ],
              isRepeatingAnimation: false,
              onTap: () {
                print("Tap Event");
              },
            ),
            Text(
              data['current']['condition']['text'],
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      );
    }

    weatherForecastWidget(data, i) {
      var forecast = data['forecast']['forecastday'];
      var date = DateFormat.MMMd().format(DateTime.parse(forecast[i]['date']));

      return Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              date,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            Image(
              image: NetworkImage(
                  "https:${forecast[i]['day']['condition']['icon']}"),
            ),
            Text(
              "${forecast[i]['day']['mintemp_f'].truncate().toString()} F °  ",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            Text(
              "${forecast[i]['day']['maxtemp_f'].truncate().toString()} F °  ",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      );
    }

    Center getWeatherForecast = Center(
      child: FutureBuilder(
        future: futureWeatherApi,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = jsonDecode(snapshot.data!.body);

            return ListView(
              children: [
                SizedBox(height: 20),
                Center(
                  child: Text(
                    "${data['location']['name']}",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                SizedBox(height: 20),
                currentWeatherWidget(data),
                for (var i = 0; i < data['forecast']['forecastday'].length; i++)
                  weatherForecastWidget(data, i),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: FlutterLogo(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                              'This page was created by requesting to an external API using Dart\'s FutureBuilder widget.'),
                        ),
                      ),
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
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: getWeatherForecast,
      ),
    );
  }
}
