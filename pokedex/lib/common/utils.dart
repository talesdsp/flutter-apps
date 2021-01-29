import 'package:flutter/material.dart';
import 'package:pokedex/common/constants.dart';

class Utils {
  static Color getColorType({String type}) {
    return kMapColors[type] ?? Colors.grey;
  }
}
