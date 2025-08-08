import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../data/models/transaction_model.dart';
import '../cubit/transaction_cubit.dart';
import 'add_transaction_screen.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) =>
              TransactionCubit(Hive.box<TransactionModel>('transactions'))
                ..loadTransactions(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Transactions')),
        body: BlocBuilder<TransactionCubit, List<TransactionModel>>(
          builder: (context, transactions) {
            if (transactions.isEmpty) {
              return const Center(child: Text('No transactions found.'));
            }

            return ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final txn = transactions[index];
                return ListTile(
                  leading: Icon(
                    txn.isIncome ? Icons.arrow_downward : Icons.arrow_upward,
                    color: txn.isIncome ? Colors.green : Colors.red,
                  ),
                  title: Text(txn.title),
                  subtitle: Text(
                    '${txn.category} • ${txn.date.toLocal().toString().split(' ')[0]}',
                  ),
                  trailing: Text(
                    '${txn.isIncome ? '+' : '-'}৳${txn.amount}',
                    style: TextStyle(
                      color: txn.isIncome ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onLongPress: () {
                    context.read<TransactionCubit>().deleteTransaction(index);
                  },
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AddTransactionScreen()),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
