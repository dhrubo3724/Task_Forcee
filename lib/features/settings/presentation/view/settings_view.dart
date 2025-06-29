import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../../../core/theme/theme_cubit.dart';
import '../../../../services/export_service.dart';
import '../../../transactions/data/models/transaction_model.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isDark = false; // Theme toggle placeholder
  final _exportService = ExportService();
  void _exportData() {
    final txns = Hive.box<TransactionModel>('transactions').values.toList();

    // TODO: Implement actual file export (CSV, JSON, etc.)
    print("Exporting ${txns.length} transactions...");
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Exported data (placeholder).")),
    );
  }

  void _resetData() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text('Confirm Reset'),
            content: const Text('This will delete all transactions. Proceed?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('Yes'),
              ),
            ],
          ),
    );

    if (confirmed == true) {
      await Hive.box<TransactionModel>('transactions').clear();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("All data reset.")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: context.watch<ThemeCubit>().state == ThemeMode.dark,
            onChanged: (val) => context.read<ThemeCubit>().toggleTheme(),
          ),
          ListTile(
            leading: const Icon(Icons.file_download),
            title: const Text('Export Transactions'),
            onTap: _exportData,
          ),
          ListTile(
            leading: const Icon(Icons.delete_forever),
            title: const Text('Reset All Data'),
            onTap: _resetData,
          ),
          const Divider(),
          const ListTile(
            title: Text('Version 1.0.0'),
            subtitle: Text('Vao Expense Tracker'),
          ),
          ListTile(
            leading: const Icon(Icons.file_download),
            title: const Text('Export as CSV'),
            onTap: () => _exportService.exportAsCSV(),
          ),
          ListTile(
            leading: const Icon(Icons.file_download),
            title: const Text('Export as JSON'),
            onTap: () => _exportService.exportAsJSON(),
          ),
        ],
      ),
    );
  }
}
