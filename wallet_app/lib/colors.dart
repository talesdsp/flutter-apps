import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xffCADCED);

List<BoxShadow> kShadow = [
  BoxShadow(
    color: Colors.white.withOpacity(.5),
    spreadRadius: -5,
    offset: const Offset(-5, -5),
    blurRadius: 30,
  ),
  BoxShadow(
    color: Colors.blue[900].withOpacity(.2),
    spreadRadius: 2,
    offset: const Offset(7, 7),
    blurRadius: 20,
  ),
];

const List expenses = [
  {"name": 'Groceries', 'amount': 500},
  {"name": 'Online Shopping', 'amount': 100},
  {"name": 'Eating Out', 'amount': 80},
  {"name": 'Bills', 'amount': 50},
  {"name": 'Subscription', 'amount': 100},
  {"name": 'Fees', 'amount': 30},
];

List<Color> pieColors = [
  Colors.indigo[400],
  Colors.blue,
  Colors.green,
  Colors.amber,
  Colors.deepOrange,
  Colors.brown,
];
