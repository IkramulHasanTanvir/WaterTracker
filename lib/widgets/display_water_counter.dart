import 'package:flutter/material.dart';
import 'package:water_tracker/widgets/neumorphism_box.dart';

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,style: const TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(
                child: trailing,
              ),
            ],
          ),
          RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.grey.shade800),
              children:  [
                TextSpan(
                  text: glassCount.toString(),
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(text: 'Glass\'s'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
