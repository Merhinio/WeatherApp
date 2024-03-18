import 'package:flutter/material.dart';
import 'package:weather_app/const/CustomStyle/customstyle.dart';
import 'package:weather_app/widget/tab_bar.dart';

class NewPage extends StatelessWidget {
  NewPage({super.key});

  final TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      bottomNavigationBar: const MyNavBar(),
      body: Container(
            decoration: customBackground(),
           child: const Column(
        children: [
          SizedBox(height: 40,),
          SearchBar(),

          
        ],
      ),
    ),);
  }
}
