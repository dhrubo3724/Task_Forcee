// lib/core/repositories/transaction_repository.dart
// Or: lib/features/transactions/repositories/transaction_repository.dart

import '../transection.dart';
import 'demo_transection_data.dart';

class TransactionRepository {
  // Simulate fetching transactions from an API or local database
  Future<List<Transaction>> fetchTransactions() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // In a real app, this is where you'd make your API call or DB query
    List<Transaction> actualTransactions = []; // Assume this is empty for now

    // --- LOGIC TO USE DEMO DATA IF ACTUAL LIST IS EMPTY ---
    if (actualTransactions.isEmpty) {
      print("Actual transactions are empty. Using demo data.");
      return DemoTransactions.transactions; // Return the demo list
    } else {
      return actualTransactions;
    }
  }

  // Example of how you might provide demo data directly if needed elsewhere
  List<Transaction> getDemoTransactionsIfEmpty(List<Transaction> currentList) {
    if (currentList.isEmpty) {
      return DemoTransactions.transactions;
    }
    return currentList;
  }
}
