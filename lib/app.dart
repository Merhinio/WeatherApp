import 'package:flutter/material.dart';
import 'package:weather_app/home/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, title: 'Weather App', home: HomePage());
  }
}
