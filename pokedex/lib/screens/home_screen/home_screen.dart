import 'package:flutter/material.dart';
import 'package:pokedex/common/constants.dart';
import 'package:pokedex/screens/home_screen/widgets/app_bar_home.dart';
import 'package:pokedex/screens/home_screen/widgets/poke_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        bottom: true,
        child: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Positioned(
              top: -(240 / 2.9),
              left: screenWidth - (240 / 1.6),
              child: Opacity(
                child: Image.asset(
                  kBlackPokeball,
                  height: 240,
                  width: 240,
                ),
                opacity: 0.1,
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  AppBarHome(),
                  PokeList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
