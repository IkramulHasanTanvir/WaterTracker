import 'package:flutter/material.dart';
import 'package:water_tracker/widgets/glasses.dart';
import 'package:water_tracker/widgets/neumorphism_box.dart';

class DrinkTile extends StatelessWidget {
  const DrinkTile({
    super.key,
    required this.glasses,
    required this.time,
    required this.date,
  });

  final int glasses;
  final String time;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0,right: 16.0,top: 16),
      child: NeumorphismBox(
        child: ListTile(
          leading: Glasses(glass: glasses),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(time,style: const TextStyle(fontSize: 14),),
              Text(date)
            ],
          ),
        ),
      ),
    );
  }
}
