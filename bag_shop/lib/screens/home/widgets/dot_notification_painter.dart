import 'package:flutter/material.dart';

class DotNotificationPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
      Offset(size.width - 10, 15),
      3,
      Paint()..color = Colors.orange,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
