import 'package:flutter/material.dart';
import "package:ice_cream_app/constants.dart";
import "package:ice_cream_app/screens/feed/feed_screen.dart";

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightPink,
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
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
              style: TextStyle(
                color: kWhite,
                fontSize: 34,
              ),
            ),
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
