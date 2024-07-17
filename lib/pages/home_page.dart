import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelx/constants/colors.dart';
import 'package:travelx/constants/fonts.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Container(
                      color: black,
                      height: 150,
                    )
                ),
                SizedBox(width: 10),
                Expanded(
                    child: Container(
                      color: Colors.blue,
                      height: 150,
                    )
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
