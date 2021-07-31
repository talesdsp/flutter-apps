import 'package:flutter/material.dart';
import 'package:plant_app/screens/checkout/checkout_screen.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          _button(context, Icons.qr_code, "Barcode", CheckoutScreen()),
          SizedBox(height: 40),
          _button(context, Icons.credit_card, "Credit Card", CheckoutScreen())
        ],
      ),
    );
  }
}

Widget _button(
    BuildContext context, IconData icon, String label, Widget screen) {
  return Material(
    color: Colors.grey[200],
    child: InkWell(
      child: Ink(
        width: double.infinity,
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            SizedBox(width: 20),
            Text(label),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => screen,
          ),
        );
      },
    ),
  );
}
