import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/const/CustomStyle/customstyle.dart';
import 'package:weather_app/home/repositories/weather_repository.dart';
import 'package:weather_app/widget/tab_bar.dart';
import 'package:weather_app/widget/weather_card_next.dart';

class NewPage extends StatefulWidget {
  NewPage({required this.repository, super.key});

  final WeatherRepository repository;

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  final cityController = TextEditingController();

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
                padding: const EdgeInsets.all(16.0),
                child: CupertinoSearchTextField(
                  controller: cityController,
                  onSubmitted: (value) {
                    setState(() {
                      widget.repository.addCity(value);
                      cityController.clear();
                    });
                  },
                  prefixIcon: const Icon(
                    CupertinoIcons.search,
                    color: Colors.white,
                  ),
                  placeholder: 'Search for a city or airport',
                  borderRadius: const BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: widget.repository.citys.length,
                    itemBuilder: (context, index) {
                      final item = widget.repository.citys[index];
                      return Dismissible(key: ValueKey(item),
                        background: Container(
                          decoration: customBackground1(),
                          child: const Icon(Icons.delete,color: Colors.white,),
                          
                        ),onDismissed: (direction) {
                          setState(() {
                            widget.repository.removeCity(item);

                          });
                        },
                        child: WeatherCard1(
                          city: item,
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
