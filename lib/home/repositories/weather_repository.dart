import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather.dart';

List<Weather> weatherData = [];

class WeatherRepository {
  static const _apiKey = 'y7PQwUEihpMQzFAvN+BXfg==VuY6x0eFbHeqgVqs';

  Future<Weather> getWeather(String city) async {
    final url = 'https://api.api-ninjas.com/v1/weather?city=$city';
    final response =
        await http.get(Uri.parse(url), headers: {'X-Api-Key': _apiKey});
    if (response.statusCode == 200) {
      
      ('response: ${response.body}');

      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Fehler beim Laden des Wetters');
    }
  }
}
