import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/fonts.dart';
import '../widgets/travel_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text('travelX', style: titleFont),
      ),
      backgroundColor: backgroundColor,
      body: const Column(
        children: [
          Row(
            children: [
              TravelCard(location: "location", date: "date", totalBudget: "totalBudget"),
              TravelCard(location: "location", date: "date", totalBudget: "totalBudget")
            ],
          )
        ],
      ),
    );
  }
}
