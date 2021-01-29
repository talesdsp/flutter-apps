import 'package:flutter/material.dart';
import 'package:ice_cream_app/constants.dart';
import 'package:ice_cream_app/model/product.dart';
import 'package:ice_cream_app/screens/details/details_screen.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final topPadding = MediaQuery.of(context).padding.top;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: kDefaultPadding / 2,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Popular",
            style: TextStyle(
              color: kHotPink,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
        SizedBox(
          height: kDefaultPadding,
        ),
        SizedBox(
          height: size.height - 220 - topPadding,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: products.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Material(
                color: products[index].secondary,
                borderRadius: BorderRadius.circular(12),
                shadowColor: Colors.black26,
                clipBehavior: Clip.none,
                elevation: 10,
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  splashColor: Colors.white24,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          product: products[index],
                        ),
                      ),
                    );
                  },
                  child: Stack(
                    overflow: Overflow.visible,
                    children: [
                      Container(
                        width: size.width - 40,
                        height: 75,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 8, 120, 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              products[index].flavor,
                              style: TextStyle(
                                color: products[index].primary,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "\$ ${products[index].price.toStringAsFixed(2)}",
                                    style: TextStyle(
                                      color: kWhite,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: List(5)
                                        .asMap()
                                        .entries
                                        .map(
                                          (entry) => Icon(
                                            products[index].stars > entry.key
                                                ? Icons.star
                                                : Icons.star_border,
                                            color: products[index].primary,
                                            size: 16,
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: -12,
                        right: 0,
                        child: Hero(
                          tag: "${products[index].flavor}",
                          child: Container(
                            alignment: Alignment.topCenter,
                            decoration: BoxDecoration(
                              boxShadow: [kDefaultShadow],
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              products[index].image,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
