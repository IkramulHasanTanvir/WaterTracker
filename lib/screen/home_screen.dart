import 'package:flutter/material.dart';
import 'package:water_tracker/screen/log_list_screen.dart';
import 'package:water_tracker/widgets/display_water_counter.dart';
import 'package:water_tracker/widgets/neumorphism_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _goalTargetTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeaderPart(),
              const SizedBox(height: 24),
              _buildGoalTarget(context),
              const SizedBox(height: 24),
              const DisplayWaterCounter(
                title: 'Now Drank',
                glassCount: 1,
              ),
              const SizedBox(height: 16),
              const Expanded(child: LogListScreen()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGoalTarget(context) {
    return DisplayWaterCounter(
      title: 'Goal Target',
      glassCount: int.tryParse(_goalTargetTEController.text) ?? 0,
      trailing: TextButton(
        onPressed: () {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: Colors.grey.shade300,
                  title: const Text('Set Goal'),
                  content: TextField(
                    keyboardType: TextInputType.number,
                    controller: _goalTargetTEController,
                    decoration: InputDecoration(
                      hintText: 'glass number',
                      suffix: IconButton(
                        onPressed: () {
                          _goalTargetTEController.clear();
                        },
                        icon: const Icon(Icons.clear),
                      ),
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        _goalTargetTEController.clear();
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        setState(() {});
                      },
                      child: const Text('Save'),
                    ),
                  ],
                );
              });
        },
        child: const Text('Edit'),
      ),
    );
  }

  Widget _buildHeaderPart() {
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

  @override
  void dispose() {
    _goalTargetTEController.dispose();
    super.dispose();
  }
}

