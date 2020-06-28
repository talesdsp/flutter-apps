import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ice_cream_app/constants.dart';
import 'package:ice_cream_app/screens/feed/widgets/categories.dart';
import 'package:ice_cream_app/screens/feed/widgets/display.dart';
import 'package:ice_cream_app/screens/feed/widgets/products.dart';

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Display(),
            Categories(),
            Products(),
          ],
        ),
      ),
    );
  }
}
