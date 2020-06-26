import 'package:flutter/material.dart';
import 'package:food_ordering_app/constants.dart';
import 'package:food_ordering_app/screens/details/widgets/app_bar.dart';
import 'package:food_ordering_app/screens/details/widgets/body.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: detailsAppBar(),
      body: Body(),
    );
  }
}
