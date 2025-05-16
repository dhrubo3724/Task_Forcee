import 'package:flutter/material.dart';

import 'app/theme/app_theme.dart';
import 'navigation/app_navigation.dart';

class TaskForce extends StatelessWidget {
  const TaskForce({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: AppNavigation(), // Using the corrected screen name
    );
  }
}
