import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_love_calculator/homescreen.dart';
import 'package:flutter_love_calculator/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Love Calculator',
      initialRoute: HomeScreen.tag,
      routes: {
        SplashScreen.tag: (context) => SplashScreen(),
        HomeScreen.tag: (context) => HomeScreen(),
      },
      //theme: ThemeData(de),
    );
  }
}
