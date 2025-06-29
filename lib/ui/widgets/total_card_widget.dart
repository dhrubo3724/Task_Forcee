import 'package:flutter/material.dart';

class TotalCard extends StatelessWidget {
  const TotalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Total Balance '),
                Text(
                  '৳ 20,000.00',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildDepositText('Deposit', '৳ 20,000.00'),
                buildDepositText('Expenses', '৳ 20,000.00'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDepositText(String text1, String text2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              text1,
              //'Deposit',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 9,
                backgroundColor: Colors.green[400],
                child: Icon(
                  Icons.arrow_downward,
                  color: Colors.white,
                  size: 15,
                ),
              ),
            ),
          ],
        ),
        Text(
          text2,
          // '৳ 20,000.00',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ],
    );
  }
}
