import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nutrition_app/common/constants.dart';
import 'package:nutrition_app/models/food.dart';
import 'package:nutrition_app/screens/detail_screen/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    double paddingTop = MediaQuery.of(context).padding.top;
    double paddingBottom = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      backgroundColor: kBlue,
      body: Stack(
        children: <Widget>[
          AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () {},
            ),
            actions: [
              IconButton(
                alignment: Alignment.center,
                icon: Transform.rotate(
                  angle: pi / 2,
                  child: Icon(Icons.tune, color: Colors.white),
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.scatter_plot, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 85 + paddingTop,
              left: 40,
              bottom: 30,
            ),
            child: RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.bodyText2,
                children: [
                  TextSpan(
                    text: "Healthy ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: "Food",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(top: 160 + paddingTop),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(90)),
                color: Colors.white,
              ),
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(30, 40, 20, 100),
                itemCount: foods.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Row(
                      children: <Widget>[
                        Hero(
                          tag: foods[index].image,
                          child: Image.asset(
                            foods[index].image,
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              foods[index].title,
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '\$' + foods[index].price.toStringAsFixed(2),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              RawMaterialButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Icon(Icons.add, color: Colors.black),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          DetailScreen(food: foods[index]),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            bottom: paddingBottom + 20,
            width: MediaQuery.of(context).size.width - 60,
            left: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _button(
                  Icons.search,
                ),
                _button(Icons.shopping_basket_outlined),
                RawMaterialButton(
                  fillColor: kPurple,
                  constraints: BoxConstraints(
                    minWidth: 140,
                    minHeight: 60,
                  ),
                  clipBehavior: Clip.none,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: Colors.grey.withOpacity(.2),
                    ),
                  ),
                  child: Text(
                    "Checkout",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _button(IconData _icon) => RawMaterialButton(
      fillColor: Colors.white,
      constraints: BoxConstraints(
        minWidth: 60,
        minHeight: 60,
      ),
      clipBehavior: Clip.none,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: Colors.grey.withOpacity(.2),
        ),
      ),
      child: Icon(
        _icon,
        color: Colors.black,
      ),
      onPressed: () {},
    );
