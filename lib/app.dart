import 'package:flutter/material.dart';
import 'package:task_force/ui/screens/deshboard.dart';

class TaskForce extends StatelessWidget {
  const TaskForce({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Dashboard());
  }
}
