import 'package:flutter/material.dart';
import 'package:water_tracker/screen/add_water.dart';
import 'package:water_tracker/screen/home_screen.dart';
import 'package:water_tracker/screen/log_list_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;

  final List<Widget> _screenLists = [
    const HomeScreen(),
    const HomeScreen(),
    const LogListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenLists.elementAt(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: _onTapNavigationBar,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'ADD'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'LOG LIST'),
        ],
      ),
    );
  }

  void _onTapNavigationBar(int index) {
    currentIndex = index;
    switch (index) {
      case 0:
        HomeScreen;
      case 1:
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return const AddWater();
            });
    }
    LogListScreen;
    setState(() {});
  }
}
