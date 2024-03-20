import 'package:flutter/material.dart';
import 'package:weather_app/const/CustomStyle/customstyle.dart';



import 'package:weather_app/widget/tab_bar.dart';
import 'package:weather_app/widget/weather_card.dart';

class HomePage extends StatelessWidget {
  const  HomePage({super.key});

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar:  MyNavBar(),
      body: Container(
        decoration: customBackground(),
        child: const Center(child: WeatherCard(city: 'München')),
      ),
    );
  }
}
