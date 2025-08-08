import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/theme/theme_cubit.dart';
import 'module/main_navigation_screen.dart';

class TaskForce extends StatelessWidget {
  const TaskForce({super.key});

  @override
  Widget build(BuildContext context) {
    {
      return BlocProvider(
        create: (_) => ThemeCubit(),
        child: BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, themeMode) {
            return MaterialApp(
              title: 'Vao',
              theme: ThemeData.light(useMaterial3: true),
              darkTheme: ThemeData.dark(useMaterial3: true),
              themeMode: themeMode,
              home: const MainNavigationScreen(),
            );
          },
        ),
      );
    }
  }
}
