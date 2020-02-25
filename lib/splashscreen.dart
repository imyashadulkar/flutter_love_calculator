import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_love_calculator/homescreen.dart';

class SplashScreen extends StatefulWidget {
  static final String tag = '/SplashScreen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    _iconAnimationController = new AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.easeOut);

    _iconAnimation.addListener(
      () => this.setState(() {}),
    );
    _iconAnimationController.forward();

    startTime();
    super.initState();
  }

  startTime() async {
    var _duration = Duration(seconds: 4);
    return Timer(_duration, navigationScreen);
  }

  void navigationScreen() {
    Navigator.of(context).pushReplacementNamed(HomeScreen.tag);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xffcc2b5e),
                  Color(0xff753a88),
                ],
              ),
            ),
            child: Center(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'images/love1.png',
                      height: _iconAnimation.value * 500,
                      width: _iconAnimation.value * 500,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Love',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' Calculator',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Text(
                      'Know your Love for your Partner',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        textBaseline: TextBaseline.alphabetic,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
