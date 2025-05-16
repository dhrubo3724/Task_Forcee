// lib/core/models/transaction.dart
// Or, if you prefer features: lib/features/transactions/models/transaction.dart

enum TransactionType { income, expense, transfer }

class Transaction {
  final String id;
  final String title;
  final String? description; // Optional description
  final double amount;
  final TransactionType type;
  final DateTime date;
  final String category; // e.g., "Salary", "Groceries", "Utilities"
  final String? iconName; // Optional: for an icon related to category or type

  Transaction({
    required this.id,
    required this.title,
    this.description,
    required this.amount,
    required this.type,
    required this.date,
    required this.category,
    this.iconName,
  });

  // Optional: factory constructor for JSON serialization if you plan to fetch from API
  // factory Transaction.fromJson(Map<String, dynamic> json) { ... }

  // Optional: method for JSON deserialization
  // Map<String, dynamic> toJson() { ... }
}
