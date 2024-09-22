import 'package:flutter/material.dart';
import 'package:water_tracker/screen/home_screen.dart';

class WaterTrackerApp extends StatelessWidget {
  const WaterTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  HomePage(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade300,
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
