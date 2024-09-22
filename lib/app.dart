import 'package:flutter/material.dart';
import 'package:water_tracker/screen_control.dart';

class WaterTrackerApp extends StatelessWidget {
  const WaterTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ScreenControl(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade300,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.grey.shade300,
          foregroundColor: Colors.grey.shade700,
          elevation: 0.8,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey.shade300,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.grey.shade300,
          selectedItemColor: Colors.grey.shade800,
        ),
      ),
    );
  }
}
