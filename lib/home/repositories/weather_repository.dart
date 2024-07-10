import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather.dart';

class WeatherRepository {
  static const _weatherApiKey = 'svjrE8liDYnZKKpyV2NMHg==3Kz3sLyuqXyildQ5';

  List<String> cities = [];

  
  Future<Weather> _fetchWeather(String url) async {
    final response = await http.get(Uri.parse(url), headers: {'X-Api-Key': _weatherApiKey});

    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 400) {
      throw Exception('Fehler beim Laden des Wetters: Ungültige Anfrage (400)');
    } else if (response.statusCode == 401) {
      throw Exception('Fehler beim Laden des Wetters: Nicht autorisiert (401)');
    } else if (response.statusCode == 404) {
      throw Exception('Fehler beim Laden des Wetters: Stadt nicht gefunden (404)');
    } else {
      throw Exception('Fehler beim Laden des Wetters: ${response.statusCode}');
    }
  }

  Future<Map<String, double>> _getCoordinates(String city) async {
    final encodedCity = Uri.encodeComponent(city);
    final url = 'https://geocoding-api.open-meteo.com/v1/search?name=$encodedCity';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final results = jsonDecode(response.body)['results'];
      if (results.isNotEmpty) {
        final location = results[0];
        return {
          'lat': location['latitude'],
          'lng': location['longitude'],
        };
      } else {
        throw Exception('No results found for $city');
      }
    } else {
      throw Exception('Failed to fetch coordinates');
    }
  }

  bool _isCoordinate(String input) {
    final coordinatePattern = RegExp(r'^\-?\d+(\.\d+)?,\s*\-?\d+(\.\d+)?$');
    return coordinatePattern.hasMatch(input);
  }

  Map<String, double> _parseCoordinates(String input) {
    final parts = input.split(',');
    return {
      'lat': double.parse(parts[0].trim()),
      'lng': double.parse(parts[1].trim()),
    };
  }

  void addCity(String city) {
    if (!cities.contains(city)) {
      cities.add(city);
    }
  }

  void removeCity(String city) {
    cities.remove(city);
  }
}