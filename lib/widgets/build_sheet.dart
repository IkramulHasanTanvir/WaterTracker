import 'package:flutter/material.dart';
import 'package:water_tracker/widgets/glasses.dart';
import 'package:water_tracker/widgets/neumorphism_box.dart';

class BuildSheet extends StatelessWidget {
  const BuildSheet({
    super.key,
    required this.onTapSave,
    required this.glasses,
    required this.onRemoveGlass,
    required this.onAddGlass,
  });

  final VoidCallback onTapSave;
  final int glasses;
  final VoidCallback onRemoveGlass;
  final VoidCallback onAddGlass;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.grey.shade300,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NeumorphismBox(
                child: IconButton(
                  onPressed: onRemoveGlass,
                  icon: const Icon(Icons.remove),
                ),
              ),
              SizedBox(
                height: 200,
                child: Image.asset('assets/images/glass.png'),
              ),
              NeumorphismBox(
                child: IconButton(
                  onPressed: onAddGlass,
                  icon: const Icon(Icons.add),
                ),
              ),
            ],
          ),
          Glasses(glass: glasses),
          ButtonBar(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: onTapSave,
                child: const Text('Save'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
