import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    Key key,
    @required this.icons,
    @required this.selectedIndex,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 10,
      onTap: this.onTap,
      items: this
          .icons
          .asMap()
          .map((index, asset) {
            return MapEntry(
              index,
              BottomNavigationBarItem(icon: Icon(asset), label: ""),
            );
          })
          .values
          .toList(),
      currentIndex: this.selectedIndex,
      selectedFontSize: 11.0,
      unselectedFontSize: 11.0,
    );
  }
}
