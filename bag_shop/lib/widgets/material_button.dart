import 'package:flutter/material.dart';

class MaterialButton extends StatelessWidget {
  MaterialButton({
    @required this.child,
    @required this.decoration,
    @required this.radius,
    @required this.color,
    this.splash,
    this.onTap,
  });

  final Widget child;
  final BoxDecoration decoration;
  final Function onTap;
  final BorderRadius radius;
  final Color color;
  final Color splash;

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.hardEdge,
      color: this.color,
      borderRadius: this.radius,
      child: InkWell(
        splashColor: this.splash,
        onTap: this.onTap ?? () {},
        child: Ink(
          decoration: this.decoration,
          child: this.child,
        ),
      ),
    );
  }
}
