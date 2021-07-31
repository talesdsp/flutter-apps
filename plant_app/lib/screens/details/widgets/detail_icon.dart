import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app/constants.dart';

class DetailIcon extends StatelessWidget {
  const DetailIcon({Key key, @required this.asset}) : super(key: key);

  final String asset;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 15),
            color: kPrimaryColor.withOpacity(.2),
            blurRadius: 20,
          ),
          BoxShadow(
            offset: Offset(-15, -15),
            color: Colors.white,
            blurRadius: 20,
          ),
        ],
      ),
      child: SvgPicture.asset(this.asset),
    );
  }
}
