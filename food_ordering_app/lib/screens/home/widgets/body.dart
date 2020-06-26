import 'package:flutter/material.dart';
import 'package:food_ordering_app/screens/home/widgets/category_list.dart';
import 'package:food_ordering_app/screens/home/widgets/discount_card.dart';
import 'package:food_ordering_app/screens/home/widgets/item_list.dart';
import 'package:food_ordering_app/widgets/search_box.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SearchBox(
            onChanged: (value) {},
          ),
          CategoryList(),
          ItemList(),
          DiscountCard(),
        ],
      ),
    );
  }
}
