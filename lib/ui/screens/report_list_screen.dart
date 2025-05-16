import 'package:flutter/material.dart';
import 'package:task_force/ui/screens/empty_report_screen.dart';

import '../../models/report_item.dart';
import '../widgets/report_item_card.dart';

class ReportListScreen extends StatelessWidget {
  // Demo data for the report list
  final List<ReportItem> demoReports = [
    ReportItem(
      title: 'Monthly Sales Report',
      description: 'Summary of sales for the month of October.',
      date: DateTime(2023, 10, 31),
      amount: 15000.50,
    ),
    ReportItem(
      title: 'Expense Report - Project Alpha',
      description: 'Detailed breakdown of expenses for Project Alpha.',
      date: DateTime(2023, 10, 28),
      amount: -2500.75, // Example: Negative for expenses
    ),
    ReportItem(
      title: 'Quarterly Performance Review',
      description: 'Review of team performance for Q3.',
      date: DateTime(2023, 10, 20),
      amount: 0.0, // Example: No monetary value
    ),
    ReportItem(
      title: 'Website Traffic Analysis',
      description: 'Analysis of website traffic for the last week.',
      date: DateTime(2023, 10, 15),
      amount: 0.0,
    ),
    ReportItem(
      title: 'New Client Onboarding Summary',
      description: 'Summary of new clients onboarded in October.',
      date: DateTime(2023, 10, 10),
      amount: 5000.00,
    ),
  ];

  ReportListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reports')),
      body: Container(
        decoration: BoxDecoration(
          // Set the background color for the body content
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), // Apply circular radius to top-left
            topRight: Radius.circular(20), // Apply circular radius to top-right
          ),
        ),
        child:
            demoReports.isEmpty
                ? EmptyReportsScreen()
                : ListView.builder(
                  itemCount:
                      demoReports.length, // Use the number of demo reports
                  itemBuilder: (context, index) {
                    // Create a ReportItemCard for each report item
                    return ReportItemCard(reportItem: demoReports[index]);
                  },
                ),
      ),
    );
  }
}
