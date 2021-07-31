import 'package:flutter/material.dart';

class CircularClipper extends CustomClipper<Path> {
  const CircularClipper({this.height = 60});

  final double height;

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - this.height);
    path.quadraticBezierTo(
      size.width / 4,
      size.height,
      size.width / 2,
      size.height,
    );
    path.quadraticBezierTo(
      size.width - size.width / 4,
      size.height,
      size.width,
      size.height - this.height,
    );
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
