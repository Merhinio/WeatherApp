import 'package:flutter/material.dart';
import 'package:weather_app/const/CustomStyle/customstyle.dart';

import 'package:weather_app/models/weather.dart';

import 'package:weather_app/widget/tab_bar.dart';
import 'package:weather_app/widget/weather_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Weather? weather;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 123, 40, 40),
        elevation: 0,
      ),
      bottomNavigationBar: const MyNavBar(),
      body: Stack(
        children: [
          Container(
            decoration: customBackground(),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WeatherCard(city: 'München'),
                Center(),
              ],
            ),
          ),
        ],
      ),
      
      
    );
  }
}
