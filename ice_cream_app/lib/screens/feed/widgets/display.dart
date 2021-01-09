import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ice_cream_app/constants.dart';
import 'package:ice_cream_app/widgets/top_buttons.dart';

class Display extends StatelessWidget {
  Display({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.topLeft,
      children: <Widget>[
        Container(
          height: size.height / 2.5,
          clipBehavior: Clip.none,
          width: size.width - 50,
          decoration: BoxDecoration(
            color: kPink,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(12),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(40, 90, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "THE WORLD OF",
                style: TextStyle(
                  color: kWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.w100,
                ),
              ),
              Text(
                "yummmmm",
                style: GoogleFonts.lobster(
                  color: kWhite,
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          right: size.width / 2,
          child: Material(
            child: Image.asset(
              "assets/images/strawberry.png",
              scale: 1.2,
            ),
            elevation: 10,
            shadowColor: Colors.black12,
            shape: CircleBorder(),
            clipBehavior: Clip.none,
            color: Colors.transparent,
          ),
        ),
        Positioned(
          bottom: 20,
          right: -20,
          child: Material(
            child: Image.asset(
              "assets/images/icecream-display.png",
              scale: 1.2,
            ),
            elevation: 20,
            shadowColor: Colors.black12,
            borderRadius: BorderRadius.circular(30.0),
            clipBehavior: Clip.none,
            color: Colors.transparent,
          ),
        ),
        TopButtons(
          leftIcon: Icons.cake,
          rightIcon: Icons.search,
          theme: 'primary',
        ),
      ],
    );
  }
}
