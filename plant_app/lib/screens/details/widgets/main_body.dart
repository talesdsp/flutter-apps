import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/plant.dart';

import 'detail_icon.dart';

class MainBody extends StatelessWidget {
  const MainBody({
    Key key,
    @required this.size,
    @required this.plant,
  }) : super(key: key);

  final Size size;
  final Plant plant;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: this.size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              children: [
                _sideIcons(),
                Expanded(
                  child: Hero(
                    tag: this.plant.label,
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: kPrimaryColor.withOpacity(.2),
                          )
                        ],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(70),
                          topLeft: Radius.circular(70),
                        ),
                      ),
                      child: Image.asset(
                        this.plant.asset,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 30,
              left: 20,
              right: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  this.plant.label,
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      .copyWith(color: kTextColor, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${this.plant.price.toStringAsFixed(2)}',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: kPrimaryColor),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 30,
            ),
            child: Text(
              this.plant.origin,
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(color: kPrimaryColor.withOpacity(.3)),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _sideIcons() {
  return SizedBox(
    width: 100,
    child: Column(
      children: [
        Spacer(flex: 3),
        DetailIcon(asset: 'assets/icons/sun.svg'),
        Spacer(),
        DetailIcon(asset: 'assets/icons/icon_2.svg'),
        Spacer(),
        DetailIcon(asset: 'assets/icons/icon_3.svg'),
        Spacer(),
        DetailIcon(asset: 'assets/icons/icon_4.svg'),
        Spacer(),
      ],
    ),
  );
}
