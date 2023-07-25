import 'package:flutter/material.dart';
import 'bakery_home.dart'; // Import the BakeryHomePage class
// Import the AnimatedBackground class

void main() {
  runApp(BakeryApp());
}

class BakeryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: // First page with AnimatedBackground
          BakeryHomePage(),
      //  FancyBackgroundApp(),
      // Second page with BakeryHomePage
    );
  }
}
