import 'package:flutter/material.dart';

import '../widgets/profile_appbar.dart'; // Assuming you want the same AppBar

class EmptyReportsScreen extends StatelessWidget {
  const EmptyReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppBar(title: 'Reports'), // Use the reusable AppBar
      body: Container(
        // Wrap the body content in a Container for rounded corners
        decoration: BoxDecoration(
          // Set the background color for the body content
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), // Apply circular radius to top-left
            topRight: Radius.circular(20), // Apply circular radius to top-right
          ),
        ),
        child: Padding(
          // Add padding inside the rounded container
          padding: const EdgeInsets.all(16.0), // Adjust padding as needed
          child: Center(
            // Placeholder content
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.bar_chart, size: 80, color: Colors.grey[600]),
                SizedBox(height: 20),
                Text(
                  'Reports',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'This is where your reports and analytics will be displayed.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                // You will replace this with your actual reports content
                // Example: Charts, data tables, etc.
              ],
            ),
          ),
        ),
      ),
    );
  }
}
