// lib/core/data/demo_transactions.dart
// Or: lib/features/transactions/data/demo_transactions.dart

import '../transection.dart';

class DemoTransactions {
  // Private constructor to prevent instantiation
  DemoTransactions._();

  static List<Transaction> get transactions {
    // Only return demo data if you intend for it to be a fallback.
    // In a real app, you'd have logic here or elsewhere to determine
    // if actual data exists. For this example, we just return it.
    return demoTransactionList;
  }

  static final List<Transaction> demoTransactionList = [
    Transaction(
      id: 'txn_001',
      title: 'Monthly Salary',
      description: 'Salary for October',
      amount: 3500.00,
      type: TransactionType.income,
      date: DateTime(2023, 10, 28),
      category: 'Salary',
      iconName: 'attach_money', // Material icon name
    ),
    Transaction(
      id: 'txn_002',
      title: 'Groceries Shopping',
      amount: 75.50,
      type: TransactionType.expense,
      date: DateTime(2023, 10, 29),
      category: 'Food & Drinks',
      iconName: 'shopping_cart',
    ),
    Transaction(
      id: 'txn_003',
      title: 'Rent Payment',
      description: 'November Rent',
      amount: 1200.00,
      type: TransactionType.expense,
      date: DateTime(2023, 11, 1),
      category: 'Housing',
      iconName: 'home',
    ),
    Transaction(
      id: 'txn_004',
      title: 'Internet Bill',
      amount: 60.00,
      type: TransactionType.expense,
      date: DateTime(2023, 11, 2),
      category: 'Utilities',
      iconName: 'wifi',
    ),
    Transaction(
      id: 'txn_005',
      title: 'Freelance Project Payment',
      amount: 450.00,
      type: TransactionType.income,
      date: DateTime(2023, 11, 3),
      category: 'Freelance',
      iconName: 'work',
    ),
    Transaction(
      id: 'txn_006',
      title: 'Dinner with Friends',
      amount: 42.75,
      type: TransactionType.expense,
      date: DateTime(2023, 11, 4),
      category: 'Social',
      iconName: 'restaurant',
    ),
    Transaction(
      id: 'txn_007',
      title: 'Transfer to Savings',
      description: 'Monthly savings transfer',
      amount: 500.00,
      type: TransactionType.transfer,
      date: DateTime(2023, 11, 5),
      category: 'Savings',
      iconName: 'savings',
    ),
    Transaction(
      id: 'txn_008',
      title: 'Coffee',
      amount: 4.50,
      type: TransactionType.expense,
      date: DateTime(2023, 11, 5),
      category: 'Food & Drinks',
      iconName: 'local_cafe',
    ),
  ];
}
