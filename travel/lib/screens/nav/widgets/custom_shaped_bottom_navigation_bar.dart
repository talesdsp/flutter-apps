import 'package:flutter/material.dart';
import 'package:travel/widgets/select_media_type_dialog.dart';

class CustomShapedBottomNavigationBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;

  const CustomShapedBottomNavigationBar({
    Key key,
    @required this.icons,
    @required this.selectedIndex,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return SizedBox(
      height: 70,
      child: CustomPaint(
        painter: BottomNavigationPainter(),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -15,
              left: 0,
              right: 0,
              child: ElevatedButton(
                onPressed: () {
                  selectMediaTypeDialog(context);
                },
                child: Icon(
                  Icons.add_a_photo_outlined,
                  size: 30,
                ),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: const EdgeInsets.all(12),
                  primary: Theme.of(context).primaryColor,
                ),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(this.icons[0]),
                    onPressed: () => this.onTap(0),
                  ),
                  IconButton(
                    icon: Icon(this.icons[1]),
                    onPressed: () => this.onTap(1),
                  ),
                  SizedBox(width: _size.width * 0.20),
                  IconButton(
                    icon: Icon(this.icons[2]),
                    onPressed: () => this.onTap(2),
                  ),
                  IconButton(
                    icon: Icon(this.icons[3]),
                    onPressed: () => this.onTap(3),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavigationPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double _height = 10;

    var path = Path();

    var paint = Paint()..color = Colors.white;

    path.moveTo(0, _height);

    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);

    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);

    path.arcToPoint(
      Offset(size.width * 0.60, 20),
      radius: Radius.circular(40),
      clockwise: false,
    );

    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);

    path.quadraticBezierTo(size.width * 0.80, 0, size.width, _height);

    path.lineTo(size.width, size.height);

    path.lineTo(0, size.height);

    path.close();

    var shadow = Shadow(color: Colors.black12, blurRadius: 10);
    var paintShadow = shadow.toPaint();

    var clipPath = path.shift(shadow.offset);
    canvas.drawPath(clipPath, paintShadow);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
