import 'package:flutter/material.dart';
import 'package:Valorant/screens/landing_screen.dart';
import 'package:Valorant/utils/constants.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: cSecondaryColor,
        body: Container(
            alignment: Alignment.center,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Spacer(
                flex: 2,
              ),
              Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/valorant_logo.png',
                        height: 160,
                        width: 160,
                      ),
                      const Text(
                        'VALORANT',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                            color: cPrimaryColor,
                            fontFamily: 'Valorant'),
                      ),
                    ],
                  )),
              const Spacer(
                flex: 2,
              ),
              Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    border: Border.all(color: cPrimaryColor, width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LandingScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: cPrimaryColor,
                          elevation: 0,
                          alignment: Alignment.center,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: const Icon(
                        Icons.arrow_right_alt_rounded,
                        size: 45,
                      ),
                    ),
                  )),
              const Spacer(
                flex: 1,
              )
            ])));
  }
}
