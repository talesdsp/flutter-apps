import 'package:flutter/material.dart';
import 'package:travel/screens/account/account_screen.dart';
import 'package:travel/screens/discover/discover_screen.dart';
import 'package:travel/screens/home/home_screen.dart';
import 'package:travel/screens/nav/widgets/custom_shaped_bottom_navigation_bar.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int _index = 0;

  final List<Widget> _screens = [
    DiscoverScreen(key: PageStorageKey("discoverScreen")),
    HomeScreen(key: PageStorageKey("homeScreen")),
    AccountScreen(key: PageStorageKey("accountScreen")),
    Scaffold(),
  ];

  final List<IconData> _icons = [
    Icons.search,
    Icons.home,
    Icons.people,
    Icons.settings,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(
            index: _index,
            children: _screens,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomShapedBottomNavigationBar(
              icons: _icons,
              selectedIndex: _index,
              onTap: (index) => setState(() => _index = index),
            ),
          ),
        ],
      ),
    );
  }
}
