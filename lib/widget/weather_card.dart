import 'package:flutter/material.dart';
import 'package:weather_app/const/TextStyle/textstyle.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/home/repositories/weather_repository.dart';

class WeatherCard extends StatefulWidget {
  const WeatherCard({
    required this.city,
    super.key,
  });
    final String city;

  @override
  State<WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  
    
   late final Future <Weather> weatherData;


  @override
  void initState() {
    super.initState();
    weatherData =  WeatherRepository().getWeather(widget.city);

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 200,
      decoration: BoxDecoration(
        color: const Color.fromARGB(0, 133, 46, 46),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Column(
          children: [
            FutureBuilder<Weather>(
              future: weatherData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(widget.city, style: myWeatherHeaderTextStyle,
                      ),
                      Text(
                        '${snapshot.data!.temp}°',
                        style: myWeatherHeaderTextStyle1,
                      ),
                     
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          
                          Text(
                            'H: ${snapshot.data!.maxTemp}°C',
                            style: myWeatherRowTextStyle,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'L: ${snapshot.data!.minTemp}°C',
                            style: myWeatherRowTextStyle,
                          ),
                        ],
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
