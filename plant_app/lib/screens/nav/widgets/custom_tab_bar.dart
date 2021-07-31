import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app/constants.dart';

class CustomTabBar extends StatelessWidget {
  final List<String> icons;
  final int selectedIndex;
  final Function(int) onTap;
  final bool isBottomIndicator;

  const CustomTabBar({
    Key key,
    @required this.icons,
    @required this.selectedIndex,
    @required this.onTap,
    this.isBottomIndicator = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding * 2,
      ),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -0),
            blurRadius: 20,
            color: kPrimaryColor.withOpacity(.2),
          ),
        ],
      ),
      child: TabBar(
        indicator: BoxDecoration(
          border: isBottomIndicator
              ? Border(
                  bottom: BorderSide(
                    color: kPrimaryColor,
                    width: 3.0,
                  ),
                )
              : Border(
                  top: BorderSide(
                    color: kPrimaryColor,
                    width: 3.0,
                  ),
                ),
        ),
        onTap: this.onTap,
        tabs: this
            .icons
            .asMap()
            .map((i, t) {
              bool _isSelected = this.selectedIndex == i;

              return MapEntry(
                i,
                Tab(
                  icon: SvgPicture.asset(
                    t,
                    color: _isSelected ? kPrimaryColor : Colors.grey,
                  ),
                ),
              );
            })
            .values
            .toList(),
      ),
    );
  }
}
