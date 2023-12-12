import 'package:flutter/material.dart';
import 'package:flutter_love_calculator/aboutpage.dart';
import 'package:flutter_love_calculator/homescreen.dart';
import 'package:flutter_love_calculator/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Love Calculator',
      initialRoute: SplashScreen.tag,
      routes: {
        SplashScreen.tag: (context) => SplashScreen(),
        HomeScreen.tag: (context) => HomeScreen(),
        AboutPage.tag: (context) => AboutPage(),
      },
      //theme: ThemeData(de),
    );
  }
}
