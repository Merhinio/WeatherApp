import 'package:flutter/material.dart';

BoxDecoration customBackground() {
  return const BoxDecoration(
    image: DecorationImage(
        image: AssetImage('assets/background.png'), fit: BoxFit.cover),
  );
}

BoxDecoration customNavBar() {
  return const BoxDecoration(
    image: DecorationImage(
        image: AssetImage('assets/TabBar.png'), fit: BoxFit.cover),
  );
}

BoxDecoration customBackground1() {
  return const BoxDecoration(
    image: DecorationImage(
        image: AssetImage('assets/Add.png'), fit: BoxFit.cover),
  );
}

BoxDecoration customBackground2() {
  return const BoxDecoration(
    image: DecorationImage(
        image: AssetImage('assets/Weather.png'), fit: BoxFit.fill),
  );
}



sonneRegen() {
  return Image.asset('assets/Suncloudangledrain.png', height: 160,width: 160,);
}
tornadoPng(){
  return Image.asset('assets/Tornado.png', height: 160, width: 160,);
}
mondWolkeWind(){
  return Image.asset('assets/Mooncloudfastwind.png',  height: 160, width: 160,);
}
sonneWolkeRegen() {
  return Image.asset('assets/Suncloudmidrain.png', height: 160, width: 160,);
}
mondWolkeRegen() {
  return Image.asset('assets/Moonrain.png', height: 160, width: 160,);
}
Sonne() {
  return Image.asset('assets/Sunny.png', height: 160, width: 160,);
}