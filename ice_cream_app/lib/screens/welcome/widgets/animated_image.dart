import 'package:flutter/cupertino.dart';

class AnimatedImage extends StatelessWidget {
  final String asset;
  final Size size;
  final double bottom;
  final double left;
  final double opacity;
  final double percentage;

  const AnimatedImage({
    Key key,
    @required this.asset,
    @required this.size,
    @required this.bottom,
    @required this.left,
    @required this.opacity,
    @required this.percentage,
  }) : super(key: key);

  double _getSize(Size size, double percentage) {
    return size.width * percentage;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(
        milliseconds: 480,
      ),
      curve: Curves.easeOut,
      child: AnimatedOpacity(
        opacity: opacity,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
        child: Image.asset(
          "assets/images/$asset.png",
          height: _getSize(size, percentage),
          width: _getSize(size, percentage),
          fit: BoxFit.contain,
        ),
      ),
      bottom: bottom,
      left: left,
    );
  }
}
