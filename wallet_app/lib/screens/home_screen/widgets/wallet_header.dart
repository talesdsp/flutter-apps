import 'package:flutter/material.dart';
import 'package:wallet_app/colors.dart';

class WalletHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Michael's Wallet",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            height: 60,
            width: 60,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              boxShadow: kShadow,
              color: kPrimaryColor,
              shape: BoxShape.circle,
            ),
            child: Stack(
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      boxShadow: kShadow,
                      color: kPrimaryColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Center(
                  child: Icon(Icons.notifications),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
