import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_love_calculator/aboutpage.dart';
import 'package:flutter_love_calculator/lovecalculator.dart';
import 'package:flutter_love_calculator/resultpage.dart';
import 'package:flutter_love_calculator/utitlities.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  static final String tag = '/HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _myName = new TextEditingController();
  TextEditingController _partnerName = new TextEditingController();
  String? myName, partnerName;
  String? percentage;

  void _clear() {
    setState(() {
      percentage = '';
      _myName.clear();
      _partnerName.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0.0,
        bottomOpacity: 0.0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [
                1,
                0.0,
              ],
              colors: [
                Color(0xffcc2b5e),
                Color(0xff753a88),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Love Calculator',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actionsIconTheme: IconThemeData(opacity: 2.0),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info),
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).pushNamed(AboutPage.tag);
            },
          ),
        ],
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      primary: true,
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
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Center(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: AspectRatio(
                          aspectRatio: 3 / 2,
                          child: Image.asset(
                            'images/love1.png',
                            height: 400,
                            width: 400,
                          ),
                        ),
                      ),
                      GetName(hint: 'Enter your Name', name: _myName),
                      GetName(
                          hint: 'Enter your Partner Name', name: _partnerName),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            button(
                              'Heart',
                              FontAwesomeIcons.solidHeart,
                              Colors.red,
                              () {
                                myName = _myName.text.toString().toLowerCase();
                                partnerName =
                                    _partnerName.text.toString().toLowerCase();
                                if (myName!.length == 0 ||
                                    partnerName!.isEmpty) {
                                  print('Enter the Names');
                                  alert();
                                } else {
                                  LoveCalculator calc = LoveCalculator();
                                  String calculation = calc.countChars(
                                      myName ?? "", partnerName ?? "");
                                  print('calculation: ' + calculation);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ResultPage(
                                              resultPercentage: calculation)));
                                }
                              },
                            ),
                            button(
                              'Clear',
                              FontAwesomeIcons.xmark,
                              Colors.red,
                              _clear,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  alert() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Enter the Names',
            style: TextStyle(color: Colors.black),
            textAlign: TextAlign.center,
            maxLines: 1,
            textDirection: TextDirection.ltr,
          ),
          actions: <Widget>[
            TextButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                FontAwesomeIcons.solidThumbsUp,
                color: Colors.redAccent,
              ),
              label: Text(''),
              autofocus: true,
            ),
          ],
          elevation: 24.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
        );
      },
    );
  }
}
