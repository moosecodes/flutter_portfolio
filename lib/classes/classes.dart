import 'package:http/http.dart' as http;
import 'dart:async';

Future<http.Response> getCurrentWeather() async {
  return http.get(Uri.parse(
      'http://api.weatherapi.com/v1/current.json?key=c0d5e7fcbbb743359b1190117232901&q=90004&aqi=no'));
}

Future<http.Response> getWeatherForecast() async {
  return http.get(Uri.parse(
      'http://api.weatherapi.com/v1/forecast.json?key=c0d5e7fcbbb743359b1190117232901&q=90004&days=5&aqi=no&alerts=no'));
}

Future<http.Response> getNewsArticles() async {
  return await http.get(
    Uri.parse(
        'https://newsapi.org/v2/everything?q=technology&language=en&sortBy=popularity'),
    // Send authorization headers to the backend.
    headers: {'x-api-key': '57adc0c480df4edd8c2eaa05e5e9f61e'},
  );
}
