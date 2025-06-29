import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../data/models/transaction_model.dart';

class TransactionCubit extends Cubit<List<TransactionModel>> {
  final Box<TransactionModel> _box;

  TransactionCubit(this._box) : super([]);

  void loadTransactions() => emit(_box.values.toList());

  void addTransaction(TransactionModel txn) async {
    await _box.add(txn);
    loadTransactions();
  }

  void deleteTransaction(int index) async {
    await _box.deleteAt(index);
    loadTransactions();
  }
}
