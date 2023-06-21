import 'package:http/http.dart' as http;
import 'dart:async';
// import 'package:location/location.dart';

Future<http.Response> getCurrentWeather({zip = '90004'}) async {
  String params = 'key=c0d5e7fcbbb743359b1190117232901&q=$zip&aqi=no';
  return http
      .get(Uri.parse('https://api.weatherapi.com/v1/current.json?$params'));
}

Future<http.Response> getWeatherForecast({zip = '90004'}) async {
  String params =
      "key=c0d5e7fcbbb743359b1190117232901&q=$zip&days=5&aqi=no&alerts=no";
  return http
      .get(Uri.parse('https://api.weatherapi.com/v1/forecast.json?$params'));
}

Future<http.Response> getNewsArticles() async {
  return await http.get(
    Uri.parse(
        'https://newsapi.org/v2/everything?q=technology&language=en&sortBy=popularity'),
    // Send authorization headers to the backend.
    headers: {'x-api-key': '57adc0c480df4edd8c2eaa05e5e9f61e'},
  );
}

Future<http.Response> getNewsCatcherArticles() async {
  return await http.get(
    Uri.parse('https://api.newscatcherapi.com/v2/search?q=Tesla'),
    // Send authorization headers to the backend.
    headers: {'x-api-key': '7zqiUffFwIhozE9JZ-9g8AFea_dRMks5Ss99YhmjQVc'},
  );
}
