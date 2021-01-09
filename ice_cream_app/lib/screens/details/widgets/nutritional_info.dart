import 'package:flutter/cupertino.dart';
import 'package:ice_cream_app/constants.dart';
import 'package:ice_cream_app/model/product.dart';

class NutritionalInfo extends StatelessWidget {
  final Product product;
  NutritionalInfo({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * .5 - 30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          NutritionalText(
              info: '${product.energy}',
              suffix: 'KL',
              description: "energy",
              color: product.secondary),
          NutritionalText(
              info: '${product.calories}',
              suffix: 'KCal',
              description: "calories",
              color: product.secondary),
          NutritionalText(
              info: '${product.calcium}',
              suffix: '%',
              description: "calcium",
              color: product.secondary),
          NutritionalText(
              info: '${product.sugar}',
              suffix: 'g',
              description: "sugar",
              color: product.secondary),
        ],
      ),
    );
  }
}

class NutritionalText extends StatelessWidget {
  final String info, suffix, description;
  final Color color;
  NutritionalText({
    Key key,
    @required this.info,
    @required this.suffix,
    @required this.description,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      child: RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            TextSpan(
              text: info,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
            TextSpan(
              text: '$suffix\n',
              style: TextStyle(
                fontSize: 17,
                color: color,
              ),
            ),
            TextSpan(
              text: description,
              style: TextStyle(
                fontSize: 18,
                color: kGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
