import 'package:flutter/material.dart';
import 'package:weather_app/const/CustomStyle/customstyle.dart';
import 'package:weather_app/const/TextStyle/textstyle.dart';
import 'package:weather_app/home/repositories/weather_repository.dart';
import 'package:weather_app/models/weather.dart';

class WeatherCard1 extends StatefulWidget {
  const WeatherCard1({
    required this.city,
    super.key,
  });
  final String city;

  @override
  State<WeatherCard1> createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard1> {
  late final Future<Weather> weatherData;

  @override
  void initState() {
    super.initState();
    weatherData = WeatherRepository().getWeather(widget.city);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 350,
      decoration: customBackground2(),
      child: Stack(
        children: [
          Column(
            children: [
              FutureBuilder<Weather>(
                future: weatherData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    final item = snapshot.data!;
                    
                    return Stack(children: [
                      Positioned(
                        left: 200,
                        bottom: 10,
                        child: item.temp <= 10
                            ? mondWolkeRegen()
                            : item.temp <= 18
                            ? sonneWolkeRegen()
                            : item.temp <= 25
                            ? mondWolkeWind()
                            : item.temp <= 30
                            ? Sonne()
                            : mondWolkeWind()
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 85, bottom: 5, top: 55),
                            child: Text(
                              '${item.temp}°',
                              style: myWeatherHeaderTextStyle2,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 85, bottom: 1),
                            child: Row(
                              children: [
                                Text(
                                  'H: ${item.maxTemp}°C',
                                  style: myWeatherRowTextStyle1,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  'L: ${item.minTemp}°C',
                                  style: myWeatherRowTextStyle1,
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 60, bottom: 1),
                                child: Text(
                                  widget.city,
                                  style: myWeatherRowTextStyle2,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ]);
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
