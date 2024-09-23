import 'package:flutter/material.dart';
import 'package:water_tracker/models/water_tracker.dart';
import 'package:water_tracker/ui/Drink_tile.dart';
import 'package:water_tracker/ui/build_dialog.dart';
import 'package:water_tracker/ui/build_header.dart';
import 'package:water_tracker/ui/build_sheet.dart';
import 'package:water_tracker/ui/display_water_counter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.waterTrackerList,
  });

  final List<WaterTracker> waterTrackerList;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _dialogTEController = TextEditingController();

  int glass = 0;
  int totalGlass = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _buildFloatingActionButton(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BuildHeader(),
              const SizedBox(height: 24),
              DisplayWaterCounter(
                title: 'Goal Target',
                glassCount: int.tryParse(_dialogTEController.text) ?? 0,
                trailing: _goalTargetEditButton(context),
              ),
              const SizedBox(height: 24),
              DisplayWaterCounter(
                title: 'Now Drink',
                glassCount: totalGlass,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Drink log'),
                  TextButton(
                    onPressed: () {
                      widget.waterTrackerList.clear();
                      setState(() {});
                    },
                    child: Text(
                      'Clear all',
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: widget.waterTrackerList.isEmpty
                    ? const Center(
                        child: Text('No drinks logged yet'),
                      )
                    : ListView.builder(
                        itemCount: widget.waterTrackerList.length,
                        itemBuilder: (context, index) {
                          final tracker = widget.waterTrackerList[index];
                          return DrinkTile(
                            glasses: tracker.onOfGlasses,
                            time:
                                '${tracker.dateTime.hour}:${tracker.dateTime.minute}',
                            date:
                                '${tracker.dateTime.day}/${tracker.dateTime.month}/${tracker.dateTime.year}',
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

  Widget _buildFloatingActionButton(context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            isDismissible: false,
            context: context,
            builder: (context) {
              return StatefulBuilder(
                  builder: (context, StateSetter modalSetState) {
                return BuildSheet(
                  onTapSave: () {
                    _addWater(context);
                  },
                  glasses: glass,
                  onRemoveGlass: () {
                    if (glass > 0) {
                      glass--;
                      modalSetState(() {});
                    }
                  },
                  onAddGlass: () {
                    glass++;
                    modalSetState(() {});
                  },
                );
              });
            });
      },
      child: const Icon(Icons.add),
    );
  }

  Widget _goalTargetEditButton(context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return BuildDialog(
                controller: _dialogTEController,
                tapToClear: _dialogTEController.clear,
                onTapSave: () {
                  setState(() {});
                  Navigator.pop(context);
                },
                onTapCancel: () {
                  _dialogTEController.clear();
                  Navigator.pop(context);
                },
              );
            });
      },
      child: const Text('Edit'),
    );
  }

  void _addWater(context) {
    WaterTracker waterTracker = WaterTracker(
      onOfGlasses: glass,
      dateTime: DateTime.now(),
    );
    widget.waterTrackerList.add(waterTracker);
    totalGlass += glass;
    glass = 0;
    setState(() {});
    Navigator.pop(context);
  }
}
