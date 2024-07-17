import 'package:flutter/material.dart';

import '../constants/fonts.dart';

class TravelCard extends StatelessWidget {
  final String location;
  final String date;
  final String totalBudget;

  const TravelCard({
    super.key,
    required this.location,
    required this.date,
    required this.totalBudget,
  });

  @override
  Widget build(BuildContext context) {
    final double generalSize = MediaQuery.of(context).size.width / 2;
    return Container(
      margin: const EdgeInsets.all(8.0),
      height: generalSize - 30,
      width: generalSize - 20,
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://images.pexels.com/photos/2283493/pexels-photo-2283493.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.black, Colors.transparent],
                stops: [0.3, 1.0], // Adjust the stops to control the gradient height
              ),
            ),
          ),
          // Text content
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(location, style: p1),
                Text(date, style: p1),
                Text(totalBudget, style: p1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}