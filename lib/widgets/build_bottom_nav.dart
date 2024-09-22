import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BuildBottomNav extends StatelessWidget {
  const BuildBottomNav({
    super.key,
    required this.onTabChange,
    required this.selectedIndex,
  });

  final ValueChanged<int> onTabChange;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: GNav(
        onTabChange: onTabChange,
        selectedIndex: selectedIndex,
        mainAxisAlignment: MainAxisAlignment.center,
        activeColor: Colors.grey.shade700,
        color: Colors.grey.shade400,
        tabActiveBorder: Border.all(color: Colors.white),
        tabBorderRadius: 24,
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.list,
            text: 'List',
          ),
        ],
      ),
    );
  }
}
