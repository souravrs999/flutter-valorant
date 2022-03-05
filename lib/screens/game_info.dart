import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test_app/models/agents.dart';
import 'package:test_app/models/events.dart';
import 'package:test_app/utils/constants.dart';
import 'package:http/http.dart' as http;

class GameInfo extends StatefulWidget {
  const GameInfo({Key? key}) : super(key: key);

  @override
  State<GameInfo> createState() => _GameInfoState();
}

class _GameInfoState extends State<GameInfo> {
  late Future<Agents> _agentsData;
  late Future<Events> _eventsData;

  Future<Agents> _fetchAgentsData() async {
    const apiUrl =
        'https://valorant-api.com/v1/agents?isPlayableCharacter=true';
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      return Agents.fromJson(json.decode(response.body));
    } else {
      throw Exception('error');
    }
  }

  Future<Events> _fetchEventsData() async {
    const apiUrl = 'https://valorant-api.com/v1/events';
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      return Events.fromJson(json.decode(response.body));
    } else {
      throw Exception('error');
    }
  }

  @override
  void initState() {
    super.initState();
    _agentsData = _fetchAgentsData();
    _eventsData = _fetchEventsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cSecondaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          FutureBuilder<Agents>(
              future: _agentsData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.48,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.data.length,
                        itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.only(left: 25),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: cPrimaryColor),
                                child: Stack(fit: StackFit.expand, children: [
                                  Image.network(
                                    '${snapshot.data!.data[index].background}',
                                    color: cSecondaryColor,
                                  ),
                                  Image.network(
                                    '${snapshot.data!.data[index].fullPortrait}',
                                    fit: BoxFit.cover,
                                  ),
                                  Positioned.fill(
                                      bottom: 25,
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                  snapshot.data!.data[index]
                                                      .displayName
                                                      .toUpperCase(),
                                                  style: const TextStyle(
                                                      fontSize: 30,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w900)),
                                              Text(
                                                snapshot.data!.data[index].role!
                                                    .displayName
                                                    .toUpperCase(),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )
                                            ]),
                                      ))
                                ]),
                              ),
                            )),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'MEDIA',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w900),
                ),
                Text(
                  'View All',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          FutureBuilder<Events>(
              future: _eventsData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data!.data.length,
                        itemBuilder: (_, index) =>
                            Text(snapshot.data!.data[index].displayName)),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })
          // Container(
          //   height: MediaQuery.of(context).size.height * 0.48,
          //   child: ListView(
          //     scrollDirection: Axis.horizontal,
          //     children: [
          //       Padding(
          //         padding: const EdgeInsets.only(left: 25),
          //         child: Container(
          //           width: MediaQuery.of(context).size.width * 0.65,
          //           decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(20),
          //               color: cPrimaryColor),
          //         ),
          //       )
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
