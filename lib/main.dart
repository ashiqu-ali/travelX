import 'package:flutter/material.dart';
import '../pages/home_page.dart';

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
        fontFamily: 'GoogleFonts'
      ),
    );
  }
}
