import 'package:flutter/material.dart';

class UnderlinePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final StrokeCap strokeCap;

  const UnderlinePainter(
      {this.strokeWidth = 3, this.color, this.strokeCap = StrokeCap.butt});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(
      Offset(0, size.height),
      Offset(size.width, size.height),
      Paint()
        ..color = this.color
        ..strokeWidth = this.strokeWidth
        ..strokeCap = this.strokeCap,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
