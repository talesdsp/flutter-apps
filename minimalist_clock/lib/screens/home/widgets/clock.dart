import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:minimalist_clock/constants.dart';
import 'package:minimalist_clock/providers/theme_provider.dart';
import 'package:minimalist_clock/size_config.dart';
import 'package:provider/provider.dart';

import 'clock_painter.dart';

class Clock extends StatefulWidget {
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  DateTime _dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _dateTime = DateTime.now();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0),
                    color: kShadowColor.withOpacity(.14),
                    blurRadius: 64,
                  )
                ],
              ),
              child: Transform.rotate(
                angle: -pi / 2,
                child: CustomPaint(
                  painter: ClockPainter(context, _dateTime),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 50,
          left: 0,
          right: 0,
          child: Consumer<ThemeProvider>(builder: (context, theme, child) {
            return GestureDetector(
              onTap: () => theme.changeTheme(),
              child: Ink(
                child: SvgPicture.asset(
                  theme.isLightTheme
                      ? "assets/icons/Sun.svg"
                      : "assets/icons/Moon.svg",
                  width: 24,
                  height: 24,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
