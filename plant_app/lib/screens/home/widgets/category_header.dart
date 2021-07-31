import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/widgets/underline_painter.dart';

class CategoryHeader extends StatelessWidget {
  const CategoryHeader({
    Key key,
    @required this.label,
    @required this.action,
    @required this.onPress,
  }) : super(key: key);

  final String label, action;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomPaint(
            willChange: false,
            painter: UnderlinePainter(),
            child: Text(
              this.label,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          FlatButton(
            onPressed: this.onPress,
            color: kPrimaryColor,
            shape: StadiumBorder(),
            child: Text(
              this.action,
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
