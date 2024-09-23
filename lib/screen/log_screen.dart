import 'package:flutter/material.dart';
import 'package:water_tracker/models/water_tracker.dart';
import 'package:water_tracker/ui/Drink_tile.dart';

class LogScreen extends StatelessWidget {
  const LogScreen({
    super.key,
    required this.waterTrackerList,
  });

  final List<WaterTracker> waterTrackerList;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Drink Log',
              style: TextStyle(fontSize: 24),
            ),
            Expanded(
              child: waterTrackerList.isEmpty
                  ? const Center(
                      child: Text('No drinks logged yet'),
                    )
                  : ListView.builder(
                      itemCount: waterTrackerList.length,
                      itemBuilder: (context, index) {
                        WaterTracker tracker = waterTrackerList[index];
                        return DrinkTile(
                          glasses: tracker.onOfGlasses,
                          time:
                              '${tracker.dateTime.hour}:${tracker.dateTime.minute}',
                          date:
                              '${tracker.dateTime.day}/${tracker.dateTime.month}/${tracker.dateTime.year}',
                        );
                      }),
            ),
          ],
        ),
      ),
    );
  }
}
