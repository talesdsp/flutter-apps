import 'package:flutter/material.dart';
import 'package:ice_cream_app/constants.dart';

class Categories extends StatefulWidget {
  Categories({Key key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final List<String> iceCreamShapes = [
    "Cup",
    "Candy",
    "Cones",
    "Sundae",
    "Milkshake",
    "Smoothie",
  ];
  final List<IconData> iceCreamIcons = [
    Icons.cake,
    Icons.cake,
    Icons.cake,
    Icons.cake,
    Icons.cake,
    Icons.cake
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: 100,
      margin: EdgeInsets.only(
        top: kDefaultPadding,
      ),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: iceCreamShapes.length,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Padding(
            padding: EdgeInsets.only(
              left: kDefaultPadding,
              right: index == iceCreamShapes.length - 1 ? kDefaultPadding : 0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                    bottom: kDefaultPadding / 2,
                  ),
                  clipBehavior: Clip.none,
                  padding: EdgeInsets.symmetric(
                    horizontal: kDefaultPadding / 1.4,
                    vertical: kDefaultPadding / 1.4,
                  ),
                  child: Icon(
                    iceCreamIcons[index],
                    color: selectedIndex == index ? kWhite : kGrey,
                  ),
                  decoration: BoxDecoration(
                    color: selectedIndex == index ? kHotPink : kWhite,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                ),
                Text(
                  iceCreamShapes[index],
                  style: TextStyle(
                    color: selectedIndex == index ? kHotPink : kGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
