import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:test_app/models/maps.dart';
import 'package:test_app/models/agents.dart';
import 'package:test_app/models/events.dart';

import 'package:test_app/utils/constants.dart';

class GameInfo extends StatefulWidget {
  const GameInfo({Key? key}) : super(key: key);

  @override
  State<GameInfo> createState() => _GameInfoState();
}

class _GameInfoState extends State<GameInfo> {
  late Future<Agents> _agentsData;
  late Future<Events> _eventsData;
  late Future<Maps> _MapsData;

  Future<Agents> _fetchAgentsData() async {
    var res = await http.get(Uri.parse(
        'https://valorant-api.com/v1/agents?isPlayableCharacter=true'));
    if (res.statusCode == 200) {
      return Agents.fromJson(json.decode(res.body));
    } else {
      throw Exception('Error');
    }
  }

  Future<Events> _fetchEventsData() async {
    var res = await http.get(Uri.parse('https://valorant-api.com/v1/events'));
    if (res.statusCode == 200) {
      return Events.fromJson(json.decode(res.body));
    } else {
      throw Exception('Error');
    }
  }

  Future<Maps> _fetchMapsData() async {
    var res = await http.get(Uri.parse('https://valorant-api.com/v1/maps'));
    if (res.statusCode == 200) {
      return Maps.fromJson(json.decode(res.body));
    } else {
      throw Exception('Error');
    }
  }

  @override
  void initState() {
    super.initState();
    _agentsData = _fetchAgentsData();
    _MapsData = _fetchMapsData();
    // _eventsData = _fetchEventsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cSecondaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: 25,
          ),
          FutureBuilder<Agents>(
              future: _agentsData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.45,
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
                                  snapshot.data!.data[index].background != null
                                      ? Image.network(
                                          '${snapshot.data!.data[index].background}',
                                          color: cSecondaryColor,
                                        )
                                      : Image.asset(
                                          'assets/images/valorant_logo.png',
                                          color: cSecondaryColor,
                                        ),
                                  Image.network(
                                    snapshot.data!.data[index].fullPortrait !=
                                            null
                                        ? '${snapshot.data!.data[index].fullPortrait}'
                                        : 'https://via.placeholder.com/150',
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
          FutureBuilder<Maps>(
              future: _MapsData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                      flex: 1,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data!.data.length,
                          itemBuilder: (_, index) => Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 15),
                                child: SizedBox(
                                  child: Row(children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: SizedBox(
                                            height: 100,
                                            width: 100,
                                            // ignore: unnecessary_null_comparison
                                            child: Image.network(
                                              snapshot.data!.data[index].splash,
                                              width: 80,
                                              fit: BoxFit.cover,
                                            ))),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          25, 0, 0, 0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            snapshot
                                                .data!.data[index].displayName,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 24,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                          Text(
                                            snapshot
                                                .data!.data[index].coordinates,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Valorant',
                                              fontSize: 14,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ]),
                                ),
                              )));
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })
        ],
      ),
    );
  }
}
