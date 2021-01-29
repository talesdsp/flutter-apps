import 'package:flutter/material.dart';
import 'package:pokedex/common/constants.dart';

Widget whitePokeball({@required String id, double size, double opacity}) {
  return AnimatedOpacity(
    duration: Duration(milliseconds: 100),
    curve: Curves.linear,
    opacity: opacity ?? 0.2,
    child: Image.asset(
      kWhitePokeball,
      height: size ?? 80,
      width: size ?? 80,
    ),
  );
}
