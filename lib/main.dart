import 'package:flutter/material.dart';
import 'package:travelx/pages/home_page.dart';


main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'travelX',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'GoogleFonts',
        primaryColor: Color(0xFFFC7B69)
      ),
    );
  }
}
