import 'package:bmi_calculator/screens/Results_page.dart';
import 'package:bmi_calculator/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'myHomePage': (context) => MyHomePage(),
        'resultsPage': (context) => ResultsPage(),
      },
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xff111639), // App bar
        scaffoldBackgroundColor: const Color(0xff111639), // scaff background
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
    );
  }
}
