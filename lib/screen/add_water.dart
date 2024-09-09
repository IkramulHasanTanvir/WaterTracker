import 'package:flutter/material.dart';
import 'package:water_tracker/water_tracker.dart';
import 'package:water_tracker/widgets/neumorphism_box.dart';

class AddWater extends StatefulWidget {
  const AddWater({super.key});

  @override
  State<AddWater> createState() => _AddWaterState();
}

class _AddWaterState extends State<AddWater> {

  int glassCount = 1;

  void _tappedToAddWater(){
    WaterTracker waterTracker = WaterTracker(onOfGlasses: glassCount, dateTime: DateTime.now());

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      height: 400,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(26),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NeumorphismBox(
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.remove),
                ),
              ),
              SizedBox(
                height: 200,
                child: Image.asset('assets/images/glass.png'),
              ),
              NeumorphismBox(
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                ),
              ),
            ],
          ),
          RichText(text:  TextSpan(
            style: TextStyle(color: Colors.grey.shade900),
              children:  [
            TextSpan(text: glassCount.toString(),style: const TextStyle(fontSize: 44),),
            const TextSpan(text: 'Glass\'s'),
          ],),),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: (){Navigator.pop(context);}, child: const Text('Cancel'),),
              TextButton(onPressed: (){}, child: const Text('Save'),),
            ],
          ),

        ],
      ),
    );
  }
}