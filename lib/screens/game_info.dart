import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:Valorant/components/agent_card.dart';
import 'package:Valorant/components/map_card.dart';

import 'package:Valorant/models/maps.dart';
import 'package:Valorant/models/agents.dart';

import 'package:Valorant/utils/constants.dart';

class GameInfo extends StatefulWidget {
  const GameInfo({Key? key}) : super(key: key);

  @override
  State<GameInfo> createState() => _GameInfoState();
}

class _GameInfoState extends State<GameInfo> {
  late Future<Agents> _agentsData;
  late Future<Maps> _MapsData;

  Future<Agents> _fetchAgentsData() async {
    var res = await http.get(Uri.parse(
        'https://valorant-api.com/v1/agents?isPlayableCharacter=true'));
    print('called agent');
    if (res.statusCode == 200) {
      return Agents.fromJson(json.decode(res.body));
    } else {
      throw Exception('Error');
    }
  }

  Future<Maps> _fetchMapsData() async {
    var res = await http.get(Uri.parse('https://valorant-api.com/v1/maps'));
    print('called maps');
    if (res.statusCode == 200) {
      return Maps.fromJson(json.decode(res.body));
    } else {
      throw Exception('Error');
    }
  }

  @override
  void initState() {
    _agentsData = _fetchAgentsData();
    _MapsData = _fetchMapsData();
    super.initState();
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
                  final agent = snapshot.data!.data;
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.45,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.data.length,
                        itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(left: 25),
                            child: AgentCard(
                              agentBackground: agent[index].background,
                              agentPortrait: agent[index].fullPortrait,
                              agentName: agent[index].displayName,
                              agentRole: agent[index].role!.displayName,
                            ))),
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
                  'MAPS',
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
                  final maps = snapshot.data!.data;
                  return Expanded(
                      flex: 1,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data!.data.length,
                          itemBuilder: (_, index) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 15),
                              child: MapCard(
                                  mapImage: maps[index].splash,
                                  mapName: maps[index].displayName,
                                  mapCoords: maps[index].coordinates))));
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
