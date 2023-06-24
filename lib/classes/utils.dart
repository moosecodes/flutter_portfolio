import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<http.Response> getCurrentWeather({zip = '90004'}) async {
  String? key = dotenv.env['weatherapi_key'];

  String params = 'key=$key&q=$zip&aqi=no';
  return http
      .get(Uri.parse('https://api.weatherapi.com/v1/current.json?$params'));
}

Future<http.Response> getWeatherForecast({zip = '90004'}) async {
  String? key = dotenv.env['weatherapi_key'];

  String params = "key=$key&q=$zip&days=10&aqi=no&alerts=no";
  return http
      .get(Uri.parse('https://api.weatherapi.com/v1/forecast.json?$params'));
}

Future<http.Response> getNewsArticles() async {
  String? key = dotenv.env['newsapi_key'];
  return await http.get(
    Uri.parse(
        'https://newsapi.org/v2/everything?q=money&language=en&sortBy=popularity'),
    // Send authorization headers to the backend.
    headers: {'x-api-key': "$key"},
  );
}

Future<http.Response> getNewsCatcherArticles() async {
  String? key = dotenv.env['newscatcherapi_key'];

  return await http.get(
    Uri.parse('https://api.newscatcherapi.com/v2/search?q=business'),
    // Send authorization headers to the backend.
    headers: {'x-api-key': "$key"},
  );
}
