import 'package:flutter/material.dart';
import 'package:water_tracker/widgets/glasses.dart';
import 'package:water_tracker/widgets/neumorphism_box.dart';

class BuildSheet extends StatelessWidget {
  const BuildSheet({super.key, required this.glass, required this.quantity});

  final int glass;
  final ValueChanged<int> quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.grey.shade300,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NeumorphismBox(
                child: IconButton(
                  onPressed: () {
                    if (glass > 1) {
                      quantity(glass - 1);
                    }
                  },
                  icon: const Icon(Icons.remove),
                ),
              ),
              SizedBox(
                height: 200,
                child: Image.asset('assets/images/glass.png'),
              ),
              NeumorphismBox(
                child: IconButton(
                  onPressed: () {
                    quantity(glass + 1);
                  },
                  icon: const Icon(Icons.add),
                ),
              ),
            ],
          ),
          Glasses(glass: glass)
        ],
      ),
    );
  }
}
