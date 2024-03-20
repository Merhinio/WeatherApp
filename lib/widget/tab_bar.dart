import 'package:flutter/material.dart';
import 'package:weather_app/home/new_page.dart';
import 'package:weather_app/home/repositories/weather_repository.dart';

class MyNavBar extends StatelessWidget {
   MyNavBar({super.key});

 final WeatherRepository weatherRepository = WeatherRepository();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 100,
          width: 450,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/TabBar.png'),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 29.5, top: 25, bottom: 5),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.location_on,
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 172.5, top: 22, bottom: 5),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              color: Colors.grey,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 315.0, top: 25, bottom: 5),
          child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  NewPage(repository: weatherRepository,),
                ),
              );
            },
            icon: const Icon(
              Icons.list,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
