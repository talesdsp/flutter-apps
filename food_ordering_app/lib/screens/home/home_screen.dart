import 'package:flutter/material.dart';
import 'package:food_ordering_app/screens/home/widgets/app_bar.dart';
import 'package:food_ordering_app/screens/home/widgets/body.dart';
import 'package:food_ordering_app/widgets/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
      bottomNavigationBar: BottomNavBar(),
      body: Body(),
    );
  }
}
