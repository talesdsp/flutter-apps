import 'package:flutter/material.dart';
import 'package:plant_app/screens/account/account_screen.dart';
import 'package:plant_app/screens/favourites/favourites_screen.dart';
import 'package:plant_app/screens/home/home_screen.dart';

import 'widgets/custom_tab_bar.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int _index = 0;

  final List<Widget> _screens = [
    HomeScreen(key: PageStorageKey("homeScreen")),
    FavouritesScreen(key: PageStorageKey("favouriteScreen")),
    AccountScreen(key: PageStorageKey("accountScreen")),
  ];

  final List<String> _icons = [
    'assets/icons/flower.svg',
    'assets/icons/heart-icon.svg',
    'assets/icons/user-icon.svg',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: this._icons.length,
      child: Scaffold(
        body: TabBarView(
          children: _screens,
        ),
        bottomNavigationBar: CustomTabBar(
          icons: _icons,
          selectedIndex: _index,
          onTap: (index) => setState(() => _index = index),
        ),
      ),
    );
  }
}
