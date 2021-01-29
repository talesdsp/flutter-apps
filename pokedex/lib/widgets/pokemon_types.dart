import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<Widget> pokemonTypes({
  @required List<String> types,
  double px = 0,
  double py = 0,
  double fontSize = 12,
}) {
  return types
      .map(
        (nome) => Container(
          margin: EdgeInsets.only(right: px, bottom: py),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color.fromARGB(80, 255, 255, 255),
          ),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              nome.trim(),
              style: TextStyle(
                fontFamily: 'Google',
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      )
      .toList();
}
