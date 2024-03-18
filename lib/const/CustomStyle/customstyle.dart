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
