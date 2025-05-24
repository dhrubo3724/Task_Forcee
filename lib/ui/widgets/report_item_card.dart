import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/report_item.dart';

class ReportItemCard extends StatelessWidget {
  final ReportItem reportItem;

  const ReportItemCard({super.key, required this.reportItem});

  @override
  Widget build(BuildContext context) {
    // Format the date
    final formattedDate = DateFormat('yyyy-MM-dd').format(reportItem.date);

    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        elevation: 2.0,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                reportItem.title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                reportItem.description,
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Date: $formattedDate',
                    style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                  ),
                  Text(
                    '\$${reportItem.amount.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color:
                          Colors.green, // Example: Green for positive amounts
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
