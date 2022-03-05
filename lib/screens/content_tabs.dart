import 'package:flutter/material.dart';

class TabContent extends StatelessWidget {
  const TabContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
              bottom: const TabBar(tabs: [
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
          ])),
        ),
      ),
    );
  }
}
