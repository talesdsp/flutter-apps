import 'package:flutter/material.dart';
import 'package:wallet_app/colors.dart';

import 'pie_chart.dart';

class ExpenseSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Text(
            'Expenses',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 40, 0, 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: expenses
                      .map(
                        (v) => Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 5,
                                backgroundColor: pieColors[expenses.indexOf(v)],
                              ),
                              SizedBox(width: 5),
                              Text(
                                v['name'],
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: PieChart(),
            ),
          ],
        ),
      ],
    );
  }
}
