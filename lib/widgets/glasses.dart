import 'package:flutter/material.dart';

class Glasses extends StatelessWidget {
  const Glasses({super.key, required this.glass});

  final int glass;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(color: Colors.grey.shade800),
        children:  [
          TextSpan(
            text: glass.toString(),
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const TextSpan(text: 'Glass\'s'),
        ],
      ),
    );
  }
}
