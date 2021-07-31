import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app/constants.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final List<String> icons;
  final int selectedIndex;
  final Function(int) onTap;
  final bool isBottomIndicator;

  const CustomBottomNavigationBar({
    Key key,
    @required this.icons,
    @required this.selectedIndex,
    @required this.onTap,
    this.isBottomIndicator = false,
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
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(asset), label: "oi"),
            );
          })
          .values
          .toList(),
      currentIndex: this.selectedIndex,
      selectedItemColor: kPrimaryColor,
      selectedFontSize: 11.0,
      unselectedItemColor: Colors.grey,
      unselectedFontSize: 11.0,
    );
  }
}
