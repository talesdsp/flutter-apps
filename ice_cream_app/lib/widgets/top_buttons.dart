import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ice_cream_app/constants.dart';

class TopButtons extends StatelessWidget {
  final String theme;
  final IconData leftIcon, rightIcon;

  TopButtons({
    Key key,
    @required this.theme,
    @required this.leftIcon,
    @required this.rightIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _navButton(leftIcon, theme),
          _navButton(rightIcon, theme)
        ],
      ),
    );
  }
}

GestureDetector _navButton(
  IconData icon,
  String theme,
) {
  Color buttonColor() {
    if (theme == 'primary')
      return kWhite;
    else
      return kHotPink;
  }

  Color iconColor() {
    if (theme == 'primary')
      return kHotPink;
    else
      return kWhite;
  }

  return GestureDetector(
    child: Container(
      padding: EdgeInsets.all(
        kDefaultPadding / 2.4,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        color: buttonColor(),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: kLightPink,
            offset: Offset(1, 3),
            blurRadius: 20,
          ),
        ],
      ),
      child: Icon(
        icon,
        color: iconColor(),
      ),
    ),
    onTap: () {},
  );
}
