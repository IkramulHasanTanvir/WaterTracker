import 'package:flutter/material.dart';
import 'package:water_tracker/water_tracker.dart';
import 'package:water_tracker/widgets/neumorphism_box.dart';

class LogListScreen extends StatefulWidget {
  const LogListScreen({super.key});

  @override
  State<LogListScreen> createState() => _LogListScreenState();
}

class _LogListScreenState extends State<LogListScreen> {
  List<WaterTracker> waterTrackerLists = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Drink Log'),
              const SizedBox(height: 8),
              Expanded(
                child: ListView.separated(
                    itemCount: waterTrackerLists.length,
                    itemBuilder: (context, index) {
                      return _buildDrinkLogListTile(index);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 24,
                      );
                    },
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrinkLogListTile(int index) {
    final WaterTracker waterTracker = waterTrackerLists[index];
    return NeumorphismBox(
      child: ListTile(
        leading: Text(
          waterTracker.onOfGlasses.toString(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 44),
        ),
        title: Text(
            '${waterTracker.dateTime.hour}:${waterTracker.dateTime.minute}'),
        subtitle: const Text('glass\'s'),
        trailing: Text(
            '${waterTracker.dateTime.day}/${waterTracker.dateTime.month}/${waterTracker.dateTime.year}'),
      ),
    );
  }
}
