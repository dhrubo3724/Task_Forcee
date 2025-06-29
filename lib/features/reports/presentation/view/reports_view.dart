import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../../transactions/data/models/transaction_model.dart';
import '../../../transactions/presentation/cubit/transaction_cubit.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) =>
              TransactionCubit(Hive.box<TransactionModel>('transactions'))
                ..loadTransactions(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Reports')),
        body: BlocBuilder<TransactionCubit, List<TransactionModel>>(
          builder: (context, txns) {
            if (txns.isEmpty) {
              return const Center(child: Text('No data available'));
            }

            final dataMap = <String, double>{};

            for (var txn in txns) {
              final key = txn.category;
              final value = txn.amount;
              if (dataMap.containsKey(key)) {
                dataMap[key] = dataMap[key]! + value;
              } else {
                dataMap[key] = value;
              }
            }

            final pieSections =
                dataMap.entries.map((entry) {
                  return PieChartSectionData(
                    title: entry.key,
                    value: entry.value,
                    color:
                        Colors.primaries[dataMap.keys.toList().indexOf(
                              entry.key,
                            ) %
                            Colors.primaries.length],
                    titleStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  );
                }).toList();

            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text(
                    'Spending by Category',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  AspectRatio(
                    aspectRatio: 1.2,
                    child: PieChart(PieChartData(sections: pieSections)),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
