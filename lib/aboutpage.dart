import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:url_launcher/url_launcher_string.dart';

class AboutPage extends StatelessWidget {
  static final String tag = '/AboutPage';

  _launchURL(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About Me',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
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
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
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
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage('images/elaishane.jpg'),
                    ),
                    Text(
                      'Yash Adulkar',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Flutter Developer | Organiser | Mentor | Speaker',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        textBaseline: TextBaseline.alphabetic,
                      ),
                    ),
                    Divider(
                      thickness: 1.5,
                      endIndent: 10.0,
                      indent: 10.0,
                      color: Colors.white,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25.0, right: 25.0),
                      child: Text(
                        'Hello there, I am Yash Adulkar. A 3rd year Student pursuing his degree in B.E. Information Technology from the University Of Mumbai. I posses keen interests and practical exposure in Android development and Flutter.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            FontAwesomeIcons.facebook,
                            size: 35.0,
                            color: Colors.white,
                          ),
                          onPressed: () async {
                            await _launchURL(
                                'https://www.facebook.com/yash.adulkar');
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            FontAwesomeIcons.instagram,
                            size: 35.0,
                            color: Colors.white,
                          ),
                          onPressed: () async {
                            await _launchURL(
                                'https://www.instagram.com/imyashadulkar');
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            FontAwesomeIcons.twitter,
                            size: 35.0,
                            color: Colors.white,
                          ),
                          onPressed: () async {
                            await _launchURL(
                                'https://twitter.com/imyashadulkar');
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            FontAwesomeIcons.medium,
                            size: 35.0,
                            color: Colors.white,
                          ),
                          onPressed: () async {
                            await _launchURL('https://medium.com/@yashadulkar');
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            FontAwesomeIcons.github,
                            size: 35.0,
                            color: Colors.white,
                          ),
                          onPressed: () async {
                            await _launchURL('https://github.com/elaishane');
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
