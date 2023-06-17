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
