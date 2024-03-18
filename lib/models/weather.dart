import 'package:json_annotation/json_annotation.dart';
part 'weather.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Weather {
   double temp;
   int minTemp;
  int maxTemp;

  Weather({
   required this.temp,
   required this.minTemp,
   required this.maxTemp,

  });
  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
