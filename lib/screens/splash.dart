import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:test_app/screens/landing_screen.dart';
import 'package:test_app/utils/constants.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SplashScreen(
      backgroundColor: cSecondaryColor,
      image: Image.asset('assets/images/valorant_logo.png'),
      seconds: 2,
      navigateAfterSeconds: const LandingScreen(),
    ));
  }
}
