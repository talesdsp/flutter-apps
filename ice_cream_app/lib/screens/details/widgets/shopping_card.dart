import 'package:flutter/material.dart';
import 'package:ice_cream_app/constants.dart';
import 'package:ice_cream_app/model/product.dart';

class ShoppingCard extends StatelessWidget {
  final Function decrement;
  final Function increment;
  final String selectedSize;
  final Function selectSize;
  final Product product;
  final int units;
  final Color contrast;

  ShoppingCard({
    Key key,
    @required this.product,
    @required this.units,
    @required this.decrement,
    @required this.increment,
    @required this.selectSize,
    @required this.selectedSize,
    @required this.contrast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    const lightColor = Color(0x90f5f5f5);

    return Container(
      width: (size.width * .5) - 30,
      height: size.height * .35,
      decoration: BoxDecoration(
        color: product.secondary,
        border: Border.all(
          color: lightColor,
          width: 5,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Positioned(
              top: -30,
              left: 10,
              child: Hero(
                tag: product.flavor,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [kDefaultShadow],
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    product.image,
                    scale: .8,
                  ),
                ),
              ),
            ),
            iceSize(),
            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Qty.",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: kWhite,
                      fontSize: 18,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      color: lightColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          InkWell(
                            child: Icon(Icons.remove, color: product.primary),
                            borderRadius: BorderRadius.circular(12),
                            onTap: decrement,
                          ),
                          Text(
                            '$units',
                            style: TextStyle(
                              color: product.primary,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Material(
                            color: product.primary,
                            borderRadius: BorderRadius.circular(12),
                            child: InkWell(
                                child: Icon(Icons.add, color: contrast),
                                onTap: increment),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget iceSize() {
    const sizes = ['S', 'M', 'L'];

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ...sizes
              .map(
                (e) => GestureDetector(
                  onTap: () => selectSize(e),
                  child: Container(
                    decoration: BoxDecoration(
                      color: selectedSize == e
                          ? product.primary
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    width: 26,
                    height: 26,
                    alignment: Alignment.center,
                    child: Text(
                      e,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: selectedSize == e ? contrast : kWhite,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
