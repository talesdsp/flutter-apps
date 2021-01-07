import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:ice_cream_app/constants.dart";
import "package:ice_cream_app/screens/feed/feed_screen.dart";
import 'package:ice_cream_app/screens/welcome/widgets/animated_image.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [kLightPink, kPink],
          ),
        ),
        child: Body(),
      ),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  double _coneBottom = -100;
  double _coneLeft = -100;
  double _coneSize = .6;

  double _ballBottom = 0;
  double _ballLeft = -100;
  double _ballSize = .6;

  double _ball2Bottom = 0;
  double _ball2Left = -90;
  double _ball2Size = .6;

  double _chocolatesBottom = 0;
  double _chocolatesLeft = -100;
  double _chocolatesSize = .8;

  double _opacity = 0;

  void _updateState(Size size) {
    setState(() {
      _opacity = 1;

      _coneBottom = 0;
      _coneLeft = -size.width / 8;

      _ballBottom = size.height / 4.5;
      _ballLeft = size.width / 8;

      _ball2Bottom = size.height / 2.5;
      _ball2Left = size.width / 3;

      _chocolatesBottom = size.height / 3;
      _chocolatesLeft = size.width / 4;
    });
  }

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 1), () {
      Size size = MediaQuery.of(context).size;
      _updateState(size);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(
              kDefaultPadding * 4,
            ),
            child: Text(
              "Ice Cream Shop",
              textAlign: TextAlign.center,
              style: GoogleFonts.lobster(
                color: kWhite,
                fontSize: 34,
              ),
            ),
          ),
          AnimatedImage(
            asset: "cone",
            bottom: _coneBottom,
            left: _coneLeft,
            opacity: _opacity,
            percentage: _coneSize,
            size: size,
          ),
          AnimatedImage(
            asset: "chocolates",
            bottom: _chocolatesBottom,
            left: _chocolatesLeft,
            opacity: _opacity,
            percentage: _chocolatesSize,
            size: size,
          ),
          AnimatedImage(
            asset: "ball2",
            bottom: _ball2Bottom,
            left: _ball2Left,
            opacity: _opacity,
            percentage: _ball2Size,
            size: size,
          ),
          AnimatedImage(
            asset: "ball",
            bottom: _ballBottom,
            left: _ballLeft,
            opacity: _opacity,
            percentage: _ballSize,
            size: size,
          ),
          Positioned(
            bottom: kDefaultPadding,
            right: kDefaultPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding / 2,
                  ),
                  child: Text(
                    'Explore',
                    style: TextStyle(
                      color: kWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                LimitedBox(
                  maxWidth: size.width / 6,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: kDefaultPadding / 1.5,
                        bottom: kDefaultPadding / 1.5,
                      ),
                      child: Icon(
                        Icons.arrow_forward,
                        color: kWhite,
                      ),
                    ),
                    color: kHotPink,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return FeedScreen();
                        }),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
