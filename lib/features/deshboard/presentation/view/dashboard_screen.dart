import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../../transactions/data/models/transaction_model.dart';
import '../../../transactions/presentation/cubit/transaction_cubit.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  double calculateTotal(List<TransactionModel> txns, bool isIncome) {
    return txns
        .where((txn) => txn.isIncome == isIncome)
        .fold(0.0, (sum, txn) => sum + txn.amount);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) =>
              TransactionCubit(Hive.box<TransactionModel>('transactions'))
                ..loadTransactions(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Dashboard')),
        body: BlocBuilder<TransactionCubit, List<TransactionModel>>(
          builder: (context, txns) {
            final income = calculateTotal(txns, true);
            final expense = calculateTotal(txns, false);
            final balance = income - expense;

            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildCard('Balance', balance, Colors.blue),
                  _buildCard('Income', income, Colors.green),
                  _buildCard('Expense', expense, Colors.red),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCard(String label, double value, Color color) {
    return Card(
      color: color.withOpacity(0.1),
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(label, style: TextStyle(color: color)),
        trailing: Text(
          '৳${value.toStringAsFixed(2)}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: color,
          ),
        ),
      ),
    );
  }
}
