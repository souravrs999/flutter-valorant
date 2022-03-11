import 'package:flutter/material.dart';

class MapCard extends StatelessWidget {
  final String? mapImage;
  final String? mapName;
  final String? mapCoords;

  const MapCard(
      {Key? key,
      required this.mapImage,
      required this.mapName,
      required this.mapCoords})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
                height: 100,
                width: 100,
                // ignore: unnecessary_null_comparison
                child: Image.network(
                  '$mapImage',
                  width: 80,
                  fit: BoxFit.cover,
                ))),
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$mapName',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                '$mapCoords',
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
    );
  }
}
