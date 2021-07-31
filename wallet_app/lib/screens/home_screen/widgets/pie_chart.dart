import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wallet_app/colors.dart';

class PieChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: kShadow,
        color: kPrimaryColor,
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: CustomPaint(
              painter: PieChartPainter(),
              child: Container(),
            ),
          ),
          Center(
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: kShadow,
                color: kPrimaryColor,
              ),
              child: Center(
                child: Text(
                  '\$1234',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PieChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    var paint = new Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 50;

    double total = 0;
    expenses.forEach((element) {
      total += element['amount'];
    });

    var startRadian = -pi / 2;
    for (int i = 0; i < expenses.length; i++) {
      var currentExpense = expenses[i];
      var sweepRadian = (currentExpense['amount'] / total) * 2 * pi;

      paint.color = pieColors[i];

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startRadian,
        sweepRadian,
        false,
        paint,
      );

      startRadian += sweepRadian;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
