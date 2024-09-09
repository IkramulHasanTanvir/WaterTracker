import 'package:flutter/material.dart';

class NeumorphismBox extends StatelessWidget {
  const NeumorphismBox({super.key, required this.child, this.height, this.width});

  final Widget child;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey.shade300,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            offset: const Offset(4, 4),
            blurRadius: 16,
          ), const BoxShadow(
            color: Colors.white,
            offset: Offset(-4, -4),
            blurRadius: 16,
          )
        ]
      ),
      child: child,
    );
  }
}
