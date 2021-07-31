import 'package:flutter/material.dart';

import 'widgets/card_section.dart';
import 'widgets/expense_section.dart';
import 'widgets/wallet_header.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 120,
              child: WalletHeader(),
            ),
            Expanded(
              child: CardSection(),
            ),
            Expanded(
              child: ExpenseSection(),
            ),
          ],
        ),
      ),
    );
  }
}
