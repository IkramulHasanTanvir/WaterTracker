import 'package:flutter/material.dart';
import 'package:water_tracker/widgets/build_dialog.dart';
import 'package:water_tracker/widgets/build_header.dart';
import 'package:water_tracker/widgets/build_sheet.dart';
import 'package:water_tracker/widgets/display_water_counter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _dialogTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return BuildSheet(glass: 0, quantity: (int value) {  },);
              });
        },
        child: const Icon(Icons.add),
      ),
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
                trailing: InkWell(
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
                ),
              ),
              const SizedBox(height: 24),
              const DisplayWaterCounter(
                title: 'Now Drink',
                glassCount: 8,
              ),
              const SizedBox(height: 24),
              const Text('Drink log'),
            ],
          ),
        ),
      ),
    );
  }
}
