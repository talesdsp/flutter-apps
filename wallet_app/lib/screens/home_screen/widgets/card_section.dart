import 'package:flutter/material.dart';
import 'package:wallet_app/colors.dart';
import 'package:wallet_app/screens/home_screen/widgets/card_details.dart';

class CardSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.topLeft,
          child: Text(
            'Card Selected',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        Expanded(
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 40,
              ),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                boxShadow: kShadow,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    top: 150,
                    bottom: -200,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: kShadow,
                        shape: BoxShape.circle,
                        color: Colors.white38,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    left: -300,
                    top: -100,
                    bottom: -100,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: kShadow,
                        shape: BoxShape.circle,
                        color: Colors.white24,
                      ),
                    ),
                  ),
                  CardDetails(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
