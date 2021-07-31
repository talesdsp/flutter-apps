import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app/constants.dart';

class HeaderWithSearchBox extends StatelessWidget {
  const HeaderWithSearchBox({Key key, this.isPinned}) : super(key: key);

  final bool isPinned;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    EdgeInsets offset = MediaQuery.of(context).padding;

    return Padding(
      padding: EdgeInsets.only(bottom: isPinned ? size.height * .2 + 40 : 60),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            height: isPinned ? 90 : size.height * .2 + 70,
            padding: const EdgeInsets.only(
              top: 60,
              left: kDefaultPadding,
              right: kDefaultPadding,
              bottom: kDefaultPadding + 20,
            ),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.blue.withOpacity(.3),
                    kPrimaryColor.withOpacity(.8)
                  ],
                ),
                borderRadius: const BorderRadius.only(
                    bottomLeft: const Radius.circular(36),
                    bottomRight: const Radius.circular(36))),
            child: isPinned
                ? SizedBox.shrink()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Hi Jenny",
                        style: Theme.of(context).textTheme.headline5.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Image.asset("assets/images/logo.png"),
                    ],
                  ),
          ),
          AnimatedPositioned(
            curve: Curves.easeOutExpo,
            duration: Duration(milliseconds: 300),
            top: isPinned ? offset.top : size.height * .2 + 40,
            left: isPinned ? size.width / 4 : 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding, vertical: 0),
              padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding, vertical: 0),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(.23),
                  ),
                ],
              ),
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                selectionHeightStyle: BoxHeightStyle.includeLineSpacingTop,
                onChanged: (value) {},
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(
                    color: kPrimaryColor.withOpacity(.5),
                  ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      "assets/icons/search.svg",
                      width: 10,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
