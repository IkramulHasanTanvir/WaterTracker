import 'package:flutter/material.dart';
import 'package:water_tracker/models/water_tracker.dart';
import 'package:water_tracker/screen/home_screen.dart';
import 'package:water_tracker/screen/log_screen.dart';
import 'package:water_tracker/ui/build_bottom_nav.dart';

class ScreenControl extends StatefulWidget {
  const ScreenControl({super.key});

  @override
  State<ScreenControl> createState() => _ScreenControlState();
}

class _ScreenControlState extends State<ScreenControl> {
  int _selectedIndex = 0;

  List<WaterTracker> waterTrackerList = [];

  final List<Widget> _screens = [];

  @override
  void initState() {
    _screens.addAll([
      HomeScreen(waterTrackerList: waterTrackerList),
      LogScreen(waterTrackerList: waterTrackerList),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BuildBottomNav(
        onTabChange: (int value) {
          _selectedIndex = value;
          setState(() {});
        },
        selectedIndex: _selectedIndex,
      ),
    );
  }
}
