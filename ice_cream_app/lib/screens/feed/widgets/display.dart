import 'package:flutter/material.dart';
import 'package:ice_cream_app/constants.dart';

class Display extends StatelessWidget {
  Display({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.topLeft,
      children: <Widget>[
        Container(
          alignment: Alignment.topLeft,
          height: size.height / 2.4,
          width: size.width - 50,
          decoration: BoxDecoration(
            color: kLightPink,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(12),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _navButton(
                Icons.cake,
              ),
              _navButton(
                Icons.search,
              )
            ],
          ),
        ),
      ],
    );
  }
}

GestureDetector _navButton(
  IconData icon,
) {
  return GestureDetector(
    child: Container(
      padding: EdgeInsets.all(
        kDefaultPadding / 2.4,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        color: kWhite,
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
        color: kHotPink,
      ),
    ),
    onTap: () {},
  );
}
