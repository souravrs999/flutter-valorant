import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class AgentCard extends StatelessWidget {
  final String? agentBackground;
  final String? agentPortrait;
  final String? agentName;
  final String? agentRole;

  const AgentCard(
      {Key? key,
      required this.agentBackground,
      required this.agentPortrait,
      required this.agentName,
      required this.agentRole})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: cPrimaryColor),
      child: Stack(fit: StackFit.expand, children: [
        agentBackground != null
            ? CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: '$agentBackground',
                placeholder: (context, url) => Opacity(
                    opacity: 0.2,
                    child: Image.asset(
                      'assets/images/valorant_logo.png',
                      color: cSecondaryColor,
                    )),
                color: cSecondaryColor,
              )
            : Image.asset(
                'assets/images/valorant_logo.png',
                color: cSecondaryColor,
              ),
        agentPortrait != null
            ? CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: '$agentPortrait',
                placeholder: (context, url) => Opacity(
                    opacity: 0.4,
                    child: Image.asset(
                      'assets/images/agent-placeholder.png',
                      color: cSecondaryColor,
                    )),
              )
            : Image.asset(
                'assets/images/agent-placeholder.png',
                color: cSecondaryColor,
              ),
        Positioned.fill(
            bottom: 25,
            child: Align(
              alignment: Alignment.bottomCenter,
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Text('$agentName'.toUpperCase(),
                    style: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w900)),
                Text(
                  '$agentRole'.toUpperCase(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                )
              ]),
            ))
      ]),
    );
  }
}
