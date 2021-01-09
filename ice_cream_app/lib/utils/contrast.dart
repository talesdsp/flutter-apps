import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:ice_cream_app/constants.dart';

double _getContrastRatio(Color colorA) {
  double color = colorA.computeLuminance();
  const double white = 1.0;

  return (max(color, white) + 0.05) / (min(color, white) + 0.05);
}

Color getContrastColor(Color colorA) {
  final double ratio = _getContrastRatio(colorA);

  if (ratio >= 4)
    return kWhite;
  else
    return Color(0xff000000);
}
