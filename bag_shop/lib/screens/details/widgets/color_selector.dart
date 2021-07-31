import 'package:flutter/material.dart';

class ColorSelector extends StatefulWidget {
  const ColorSelector({@required this.colors});

  final List<Color> colors;

  @override
  _ColorSelectorState createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  int _colorSelected = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: this.widget.colors.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(right: 12),
          child: GestureDetector(
            onTap: () {
              setState(() {
                _colorSelected = index;
              });
            },
            child: CustomPaint(
              painter: _colorSelected == index
                  ? SelectedColorPainter(color: this.widget.colors[index])
                  : null,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: this.widget.colors[index],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SelectedColorPainter extends CustomPainter {
  const SelectedColorPainter({this.color}) : super();
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    canvas.drawCircle(
      Offset(centerX, centerY),
      12,
      Paint()
        ..color = this.color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );

    canvas.drawCircle(
      Offset(centerX, centerY),
      11,
      Paint()
        ..color = Colors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
