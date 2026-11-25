import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';

class TaskBuddyApp extends StatelessWidget {
  const TaskBuddyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TaskBuddy',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const Scaffold(
        body: Center(
          child: Text('TaskBuddy'),
        ),
      ),
    );
  }
}