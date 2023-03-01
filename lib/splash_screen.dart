// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: Colors.white,
      child: Center(
        child: SizedBox(
          width: 100,
          height: 100,
          child: CircularProgressIndicator(
            strokeWidth: 8.0,
            // stockoverflow:SplashScreen
            backgroundColor: Colors.deepPurple,
            // color: Colors.redAccent,
            value: 0.5,
            valueColor: AlwaysStoppedAnimation(Colors.deepPurpleAccent),
          ),
        ),
      ),
    );
  }
}
