import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../module/transactions/data/models/transaction_model.dart';

class ExportService {
  Future<void> exportAsCSV() async {
    final txns = Hive.box<TransactionModel>('transactions').values.toList();

    final rows = <List<String>>[
      ['Title', 'Amount', 'Date', 'Category', 'Type'],
      ...txns.map(
        (t) => [
          t.title,
          t.amount.toString(),
          t.date.toIso8601String(),
          t.category,
          t.isIncome ? 'Income' : 'Expense',
        ],
      ),
    ];

    final csv = const ListToCsvConverter().convert(rows);

    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/transactions.csv');
    await file.writeAsString(csv);

    await Share.shareXFiles([
      XFile(file.path),
    ], text: 'Vao - Exported Transactions (CSV)');
  }

  Future<void> exportAsJSON() async {
    final txns = Hive.box<TransactionModel>('transactions').values.toList();
    final jsonList =
        txns
            .map(
              (txn) => {
                'title': txn.title,
                'amount': txn.amount,
                'date': txn.date.toIso8601String(),
                'category': txn.category,
                'isIncome': txn.isIncome,
              },
            )
            .toList();

    final jsonStr = jsonEncode(jsonList);

    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/transactions.json');
    await file.writeAsString(jsonStr);

    await Share.shareXFiles([
      XFile(file.path),
    ], text: 'Vao - Exported Transactions (JSON)');
  }
}
