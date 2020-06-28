import 'package:flutter/material.dart';
import 'package:ice_cream_app/constants.dart';

class Products extends StatelessWidget {
  final products = [
    {
      "flavor": "Strawberry",
      "color": kChocolate,
      "price": 5.89,
    },
    {
      "flavor": "Pistache",
      "color": kPistache,
      "price": 6.5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        SizedBox(
          height: kDefaultPadding,
        ),
        Text(
          "Products",
          style: TextStyle(
            color: kHotPink,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        SizedBox(
          height: kDefaultPadding,
        ),
        Stack(
          children: [
            Container(
              width: size.width - 40,
              height: 70,
              decoration: BoxDecoration(
                color: products[0]['color'],
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                products[0]['flavor'],
                style: TextStyle(
                  color: kBlack,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "\$${products[0]['price']}",
                  style: TextStyle(
                    color: kWhite,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
