import 'package:flutter/material.dart';
import 'package:water_tracker/ui/glasses.dart';
import 'package:water_tracker/ui/neumorphism_box.dart';

class DisplayWaterCounter extends StatelessWidget {
  const DisplayWaterCounter({
    super.key,
    required this.title,
    required this.glassCount,
    this.trailing,
  });

  final String title;
  final int glassCount;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return NeumorphismBox(
      height: 144,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  child: trailing,
                ),
              ],
            ),
            Glasses(glass: glassCount),
          ],
        ),
      ),
    );
  }
}
