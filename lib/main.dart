import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'bakery_home.dart'; // Import the BakeryHomePage class
import './animation/animation.dart'; // Import the AnimatedBackground class

Future<void> main() async {
  await Firebase.initializeApp();
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
