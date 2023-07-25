import 'package:bakery_website/bakery_home.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import './animated_wave.dart';
import './animation_background.dart';
import 'dart:math';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import '';

class FancyBackgroundApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(child: AnimatedBackground()),
        onBottom(AnimatedWave(
          height: 180,
          speed: 1.0,
        )),
        onBottom(AnimatedWave(
          height: 120,
          speed: 0.9,
          offset: pi,
        )),
        onBottom(AnimatedWave(
          height: 220,
          speed: 1.2,
          offset: pi / 2,
        )),
        const Positioned.fill(child: CenteredText('')),
      ],
    );
  }

  onBottom(Widget child) => Positioned.fill(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: child,
        ),
      );
}
