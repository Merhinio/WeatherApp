import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_app/const/CustomStyle/customstyle.dart';
import 'package:weather_app/home/repositories/weather_repository.dart';
import 'package:weather_app/widget/tab_bar.dart';
import 'package:weather_app/widget/weather_card_next.dart';


class NewPage extends StatefulWidget {
  NewPage({required this.repository, Key? key}) : super(key: key);

  final WeatherRepository repository;

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  final TextEditingController _cityController = TextEditingController();

  void _getWeatherByCity(String city) async {
    try {
      await widget.repository.getWeatherByCity(city);
      widget.repository.addCity(city);
      _cityController.clear();
      setState(() {});
    } catch (e) {
      print('Error fetching weather: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: customBackground1(),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            iconTheme: const IconThemeData(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            actions: const [Icon(Icons.more_vert)],
          ),
          bottomNavigationBar: MyNavBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: CupertinoSearchTextField(
                  controller: _cityController,
                  onSubmitted: _getWeatherByCity,
                  prefixIcon: const Icon(
                    CupertinoIcons.search,
                    color: Colors.white,
                  ),
                  placeholder: 'Search for a city',
                  borderRadius: const BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.repository.cities.length,
                  itemBuilder: (context, index) {
                    final city = widget.repository.cities[index];
                    return Dismissible(
                      key: ValueKey(city),
                      background: Container(
                        decoration: customBackground1(),
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      onDismissed: (direction) {
                        setState(() {
                          widget.repository.removeCity(city);
                        });
                      },
                      child: WeatherCard1(city: city),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}