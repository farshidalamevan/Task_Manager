import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/splash_screen.dart';

import 'ui/utils/app_colors.dart';

class TaskManagerApp extends StatefulWidget {
  const TaskManagerApp({super.key});

  @override
  State<TaskManagerApp> createState() => _TaskManagerAppState();
}

class _TaskManagerAppState extends State<TaskManagerApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: AppColors.themeColor,
          textTheme: TextTheme(),
          inputDecorationTheme: _inputDecorationTheme(),
          elevatedButtonTheme: _elevatedButtonThemeData()),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

ElevatedButtonThemeData _elevatedButtonThemeData() {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.themeColor,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 10),
        fixedSize: Size.fromWidth(double.maxFinite),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        )),
  );
}

InputDecorationTheme _inputDecorationTheme() {
  return InputDecorationTheme(
    filled: true,
    hintStyle: TextStyle(color: Colors.grey.shade500, fontWeight: FontWeight.w400),
    fillColor: Colors.grey.shade300,
    border: _outlineInputBorder(),
    focusedBorder: _outlineInputBorder(),
    errorBorder: _outlineInputBorder(),
    enabledBorder: _outlineInputBorder(),
  );
}

OutlineInputBorder _outlineInputBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(8),
  );
}
