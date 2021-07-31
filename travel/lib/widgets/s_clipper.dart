import 'package:flutter/cupertino.dart';

class SClipper extends CustomClipper<Path> {
  final double height;
  final double multiplier;

  const SClipper({
    this.height,
    this.multiplier = 2,
  });

  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height - (this.height * this.multiplier));
    path.quadraticBezierTo(
      size.width / 4,
      size.height,
      size.width / 2,
      size.height - this.height,
    );
    path.quadraticBezierTo(
      size.width - size.width / 4,
      size.height - (this.height * this.multiplier),
      size.width,
      size.height,
    );
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
