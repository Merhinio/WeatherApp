// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      temp: (json['temp'] as num).toDouble(),
      minTemp: json['min_temp'] as int,
      maxTemp: json['max_temp'] as int,
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'temp': instance.temp,
      'min_temp': instance.minTemp,
      'max_temp': instance.maxTemp,
    };
