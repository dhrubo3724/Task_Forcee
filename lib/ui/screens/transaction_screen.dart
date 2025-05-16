import 'package:flutter/material.dart';

import '../widgets/profile_appbar.dart'; // Assuming you want the same AppBar

// You'll likely need a Transaction model later
// import 'package:task_force/models/transaction.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppBar(title: 'Transactions'), // Use the reusable AppBar
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Center(
          // Placeholder content
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.swap_horiz,
                  size: 80,
                  color: ThemeData.dark().primaryColor,
                ),
                SizedBox(height: 20),
                Text(
                  'Transactions List',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: ThemeData.dark().primaryColor,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'This is where your transaction history will be displayed.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                // You will replace this with your actual transaction list view
                // Example: ListView.builder(...)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
