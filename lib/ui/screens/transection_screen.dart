// lib/features/transactions/screens/transaction_list_screen.dart
// (or wherever your transaction_screen.dart is located)

import 'package:flutter/material.dart';
import 'package:task_force/models/repo/demo_transection_data.dart';

import '../../models/transection.dart';
import 'empty_transaction_screen.dart'; // Import your demo data
// import 'package:task_force/widgets/profile_appbar.dart'; // Your ProfileAppBar
// import 'package:task_force/app/theme/app_theme.dart'; // Your AppTheme

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  late List<Transaction> _transactions; // To hold the transactions to display

  @override
  void initState() {
    super.initState();
    // Load demo transactions directly when the screen initializes
    // In a real app, you might fetch from a repository here and then
    // decide whether to use demo data based on the result.
    _transactions = DemoTransactions.transactions;
  }

  IconData _getIconForTransaction(Transaction transaction) {
    // Simple mapping, you might want a more robust solution
    switch (transaction.iconName) {
      case 'attach_money':
        return Icons.attach_money;
      case 'shopping_cart':
        return Icons.shopping_cart;
      case 'home':
        return Icons.home;
      case 'wifi':
        return Icons.wifi;
      case 'work':
        return Icons.work;
      case 'restaurant':
        return Icons.restaurant;
      case 'savings':
        return Icons.savings;
      case 'local_cafe':
        return Icons.local_cafe;
      default:
        // Fallback icon based on transaction type
        if (transaction.type == TransactionType.income) {
          return Icons.arrow_downward_rounded; // Icon for income
        } else if (transaction.type == TransactionType.expense) {
          return Icons.arrow_upward_rounded; // Icon for expense
        }
        return Icons.swap_horiz_rounded; // Icon for transfer or other
    }
  }

  Color _getColorForAmount(Transaction transaction) {
    switch (transaction.type) {
      case TransactionType.income:
        return Colors.green[400] ?? Colors.green;
      case TransactionType.expense:
        return Colors.red[400] ?? Colors.red;
      case TransactionType.transfer:
        return Theme.of(
          context,
        ).colorScheme.onSurface.withOpacity(0.7); // Neutral color
      default:
        return Theme.of(context).colorScheme.onSurface;
    }
  }

  String _formatDate(DateTime date) {
    // Simple date formatting, you can use the `intl` package for more complex needs
    return "${date.day}/${date.month}/${date.year}";
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Get the current theme

    return Scaffold(
      // appBar: ProfileAppBar(title: 'Transactions'), // Assuming you have this
      appBar: AppBar(
        title: const Text('Transactions'),
        backgroundColor: theme.appBarTheme.backgroundColor, // Use theme
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),

        child:
            _transactions.isEmpty
                ? EmptyTransactionsScreen()
                : _buildTransactionList(theme),
        // _buildTransactionList(theme)
      ),
    );
  }

  Widget _buildTransactionList(ThemeData theme) {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: _transactions.length,
      itemBuilder: (context, index) {
        final transaction = _transactions[index];
        return Card(
          // Use CardTheme from your AppTheme
          // elevation: theme.cardTheme.elevation,
          // margin: theme.cardTheme.margin,
          // shape: theme.cardTheme.shape,
          // color: theme.cardTheme.color,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: _getColorForAmount(
                transaction,
              ).withOpacity(0.15),
              foregroundColor: _getColorForAmount(transaction),
              child: Icon(_getIconForTransaction(transaction), size: 24),
            ),
            title: Text(
              transaction.title,
              // style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.category,
                  // style: theme.textTheme.bodySmall?.copyWith(color: theme.textTheme.bodySmall?.color?.withOpacity(0.8)),
                ),
                if (transaction.description != null &&
                    transaction.description!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: Text(
                      transaction.description!,
                      // style: theme.textTheme.bodySmall?.copyWith(fontSize: 11, color: theme.textTheme.bodySmall?.color?.withOpacity(0.6)),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
              ],
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${transaction.type == TransactionType.income
                      ? '+'
                      : transaction.type == TransactionType.expense
                      ? '-'
                      : ''}\$${transaction.amount.toStringAsFixed(2)}',
                  // style: theme.textTheme.bodyLarge?.copyWith(
                  //   color: _getColorForAmount(transaction),
                  //   fontWeight: FontWeight.bold,
                  // ),
                ),
                Text(
                  _formatDate(transaction.date),
                  // style: theme.textTheme.bodySmall,
                ),
              ],
            ),
            onTap: () {
              // Handle transaction tap, e.g., navigate to detail screen
              print('Tapped on: ${transaction.title}');
              // Navigator.push(context, MaterialPageRoute(builder: (context) => TransactionDetailScreen(transaction: transaction)));
            },
          ),
        );
      },
    );
  }
}
