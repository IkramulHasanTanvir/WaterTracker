import 'package:flutter/material.dart';
import 'package:water_tracker/ui/neumorphism_box.dart';

class BuildHeader extends StatelessWidget {
  const BuildHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 100,
          width: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
                'https://avatars.githubusercontent.com/u/25007125?v=4'),
          ),
        ),
        RichText(
          text: TextSpan(
            style: TextStyle(color: Colors.grey.shade800, fontSize: 16),
            children: [
              const TextSpan(text: 'Hello\n'),
              TextSpan(
                text: 'Ostad\n',
                style: TextStyle(
                  color: Colors.grey.shade900,
                  fontSize: 44,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TextSpan(text: 'Could be Better😞'),
            ],
          ),
        ),
        const SizedBox(width: 24),
        GestureDetector(
          onTap: () {},
          child: const NeumorphismBox(
            child: Icon(
              Icons.dark_mode_outlined,
              size: 44,
            ),
          ),
        ),
      ],
    );
  }
}
