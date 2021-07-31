import 'package:flutter/material.dart';
import 'package:plant_app/models/plant.dart';

class DescriptionBody extends StatelessWidget {
  const DescriptionBody({
    Key key,
    @required this.size,
    @required this.plant,
  }) : super(key: key);

  final Size size;
  final Plant plant;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: size.height,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text(
              plant.description,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
