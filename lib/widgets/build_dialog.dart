import 'package:flutter/material.dart';

class BuildDialog extends StatelessWidget {
  const BuildDialog(
      {super.key,
      required this.controller,
      required this.tapToClear,
      required this.onTapCancel,
      required this.onTapSave});

  final TextEditingController controller;
  final VoidCallback tapToClear;
  final VoidCallback onTapCancel;
  final VoidCallback onTapSave;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey.shade300,
      title: const Text('Set Goal'),
      content: TextField(
        keyboardType: TextInputType.number,
        controller: controller,
        decoration: InputDecoration(
          hintText: 'glass number',
          suffix: IconButton(
            onPressed: tapToClear,
            icon: const Icon(Icons.clear),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: onTapCancel,
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: onTapSave,
          child: const Text('Save'),
        ),
      ],
    );
  }
}
