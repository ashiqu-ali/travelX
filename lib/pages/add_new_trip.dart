import 'package:flutter/material.dart';
import 'package:travelx/constants/colors.dart';

class AddNewTrip extends StatefulWidget {
  const AddNewTrip({super.key});

  @override
  State<AddNewTrip> createState() => _AddNewTripState();
}

class _AddNewTripState extends State<AddNewTrip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Trip Name',
                fillColor: white,
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none
                )
              ),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Description',
                  fillColor: white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}
