import 'package:flutter/material.dart';
import 'package:task_force/module/reports/presentation/view/reports_view.dart';
import 'package:task_force/module/settings/presentation/view/settings_view.dart';

import '../ui/screens/transaction_screen.dart';
import '../widget/bottom_sheet_widget.dart';
import 'deshboard/presentation/view/dashboard_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final _pages = [
    const DashboardScreen(),
    const TransactionsScreen(),
    const ReportsScreen(),
    const SettingsScreen(),
  ];
  int _getPageIndex(int conceptualIndex) {
    if (conceptualIndex < 2 || conceptualIndex >= _pages.length) {
      throw RangeError.range(
        conceptualIndex,
        0,
        _pages.length - 1,
        'conceptualIndex',
      );
    }
    return _currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: NavigationBar(
        indicatorShape: const CircleBorder(
          side: BorderSide(color: Colors.transparent, width: 0),
        ),
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() => _currentIndex = index);
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.dashboard), label: 'Home'),
          NavigationDestination(
            icon: Icon(Icons.swap_horiz),
            label: 'Transactions',
          ),

          NavigationDestination(icon: Icon(Icons.bar_chart), label: 'Reports'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => const BottomSheetWidget(),
          );
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
