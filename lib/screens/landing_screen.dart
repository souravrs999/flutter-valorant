import 'package:flutter/material.dart';
import 'package:Valorant/screens/game_info.dart';
import 'package:Valorant/utils/constants.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: cSecondaryColor,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            backgroundColor: cSecondaryColor,
            elevation: 0,
            toolbarHeight: 120,
            title: Image.asset(
              'assets/images/valorant_logo.png',
              height: 70,
            ),
            actions: const [
              Padding(
                  padding: EdgeInsets.only(right: 25),
                  child: Icon(
                    Icons.person_outline_rounded,
                    size: 35,
                  ))
            ],
            bottom: const TabBar(
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(color: cPrimaryColor, width: 5),
                    insets: EdgeInsets.fromLTRB(0, 0, 20, 0)),
                padding: EdgeInsets.symmetric(horizontal: 25),
                labelStyle:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                tabs: [
                  Tab(
                    text: 'GAME INFO',
                  ),
                  Tab(
                    text: 'MEDIA',
                  ),
                  Tab(
                    text: 'NEWS',
                  ),
                  Tab(
                    text: 'SUPPORT',
                  )
                ]),
          ),
          body: const TabBarView(children: [
            GameInfo(),
            Icon(Icons.abc),
            Icon(Icons.abc),
            Icon(Icons.abc)
          ]),
        ));
  }
}
