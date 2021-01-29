import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ice_cream_app/constants.dart';

class Checkout extends StatelessWidget {
  final double price;
  final int units;
  final Color primary, color, contrast;

  Checkout({
    Key key,
    @required this.price,
    @required this.units,
    @required this.primary,
    @required this.color,
    @required this.contrast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double bottomPadding = MediaQuery.of(context).padding.bottom;

    return Expanded(
      child: Stack(
        children: [
          Positioned(
            bottom: bottomPadding + 40,
            left: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Total:\n",
                              style: TextStyle(fontSize: 25, color: kGrey),
                            ),
                            TextSpan(
                              text: '\$${(price * units).toStringAsFixed(2)}',
                              style: TextStyle(fontSize: 36, color: color),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Material(
                  color: primary,
                  borderRadius: BorderRadius.circular(12),
                  clipBehavior: Clip.antiAlias,
                  elevation: 10,
                  shadowColor: color,
                  child: InkWell(
                    splashColor: color,
                    onTap: () {},
                    child: Container(
                      height: 60,
                      width: size.width - 60,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Place Order',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18, color: contrast),
                            ),
                            Icon(Icons.arrow_forward, color: contrast),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
