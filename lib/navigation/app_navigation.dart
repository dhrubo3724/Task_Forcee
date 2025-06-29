import 'package:flutter/material.dart';

import '../ui/screens/main_dashboard_screen.dart';
import '../ui/screens/report_list_screen.dart';
import '../ui/screens/transaction_screen.dart';

class AppNavigation extends StatefulWidget {
  const AppNavigation({super.key});

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    MainDashboardScreens(),
    TransactionsScreen(), // Replace with your actual screen widgets
    ReportListScreen(),
    // SearchAnchorWithTap(),
    // CustomTabView(),
    // DeviceSelector(),
    // CategoryTree(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _screens[_selectedIndex], // Display the selected screen
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), // Apply circular radius to top-left
          topRight: Radius.circular(20), // Apply circular radius to top-right
        ),
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Dashboard'),
            BottomNavigationBarItem(
              icon: Icon(Icons.swap_horiz),
              label: 'Transactions',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: 'Reports',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
