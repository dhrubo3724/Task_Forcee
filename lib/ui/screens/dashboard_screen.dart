import 'package:flutter/material.dart';

import '../widgets/deshboard_content.dart';
import '../widgets/profile_appbar.dart';

class DashboardScreen extends StatefulWidget {
  // Renamed class
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // Example data - replace with actual data fetching/management

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppBar(title: 'DashBoard'),
      // appBar: ProfileAppBar(title: 'Dashboard'), // Using the ProfileAppBar widget with a title
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: DashboardContent(
          // Pass the list of members to the DashboardContent widget
        ),
      ),
    );
  }
}
