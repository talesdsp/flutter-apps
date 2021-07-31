import 'package:flutter/material.dart';
import 'package:wallet_app/colors.dart';
import 'package:wallet_app/screens/home_screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallet App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Circular",
        scaffoldBackgroundColor: kPrimaryColor,
      ),
      home: HomeScreen(),
    );
  }
}
