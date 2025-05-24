import 'package:flutter/material.dart';

import 'app/theme/app_theme.dart';
import 'navigation/app_navigation.dart';

class TaskForce extends StatelessWidget {
  const TaskForce({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,

      debugShowCheckedModeBanner: false,
      home: AppNavigation(), // Using the corrected screen name
    );
  }
}
