import 'dart:math';

import 'package:flutter/material.dart';

class ClockPainter extends CustomPainter {
  final BuildContext context;
  final DateTime dateTime;

  ClockPainter(this.context, this.dateTime);

  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    Offset center = Offset(centerX, centerY);

    Paint dotPainter = Paint()
      ..color = Theme.of(context).primaryIconTheme.color;

    // Hours
    // datetime.hour * 30 bcs 360/12 = 30
    // datetime.minute * .5 to turn it a little each minute

    double hourX = centerX +
        size.width *
            .3 *
            cos((dateTime.hour * 30 + dateTime.minute * .5) * pi / 180);
    double hourY = centerY +
        size.width *
            .3 *
            sin((dateTime.hour * 30 + dateTime.minute * .5) * pi / 180);

    canvas.drawLine(
      center,
      Offset(hourX, hourY),
      Paint()
        ..color = Theme.of(context).colorScheme.secondary
        ..style = PaintingStyle.stroke
        ..strokeWidth = 10,
    );

    // Minutes

    double minX =
        centerX + size.width * .35 * cos((dateTime.minute * 6) * pi / 180);
    double minY =
        centerY + size.width * .35 * sin((dateTime.minute * 6) * pi / 180);

    canvas.drawLine(
      center,
      Offset(minX, minY),
      Paint()
        ..color = Theme.of(context).accentColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 10,
    );

    // Seconds

    // size.width * .4 defines line size
    // datetime.second * 6 so a full minute (60secs) match 360º (60*6)

    double secondX =
        centerX + size.width * .4 * cos((dateTime.second * 6) * pi / 180);

    double secondY =
        centerY + size.width * .4 * sin((dateTime.second * 6) * pi / 180);

    canvas.drawLine(
      center,
      Offset(secondX, secondY),
      Paint()..color = Theme.of(context).primaryColor,
    );

    // Circles
    canvas.drawCircle(center, 24, dotPainter);
    canvas.drawCircle(
      center,
      23,
      Paint()..color = Theme.of(context).backgroundColor,
    );
    canvas.drawCircle(center, 10, dotPainter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
