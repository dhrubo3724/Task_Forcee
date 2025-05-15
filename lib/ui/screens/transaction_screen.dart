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
          color: Colors.blue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Center(
          // Placeholder content
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.swap_horiz, size: 80, color: Colors.grey[600]),
              SizedBox(height: 20),
              Text(
                'Transactions List',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 10),
              Text(
                'This is where your transaction history will be displayed.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              // You will replace this with your actual transaction list view
              // Example: ListView.builder(...)
            ],
          ),
        ),
      ),
    );
  }
}
