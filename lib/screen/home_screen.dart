import 'package:flutter/material.dart';
import 'package:water_tracker/models/water_tracker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drink Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  List<WaterTracker> waterTracker = [];

  // For tracking the number of glasses for BottomSheet
  int glasses = 0;

  // To navigate between different tabs
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  // Bottom Sheet for Adding Drink
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      setState(() {
                        if (glasses > 0) glasses--;
                      });
                    },
                  ),
                  Column(
                    children: [
                      Icon(Icons.local_drink, size: 50, color: Colors.blue),
                      Text('$glasses Glasses'),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        glasses++;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        // Add the drink log
                        waterTracker.add(
                          WaterTracker(
                            onOfGlasses: glasses,
                            dateTime: DateTime.now(),
                          ),
                        );
                        glasses = 0; // Reset the count
                      });
                      Navigator.pop(context);
                    },
                    child: Text('Save'),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello Ostad'),
        actions: [
          IconButton(
            icon: Icon(Icons.nights_stay),
            onPressed: () {
              // Implement Dark Mode Toggle here
            },
          )
        ],
      ),
      body: selectedIndex == 0 ? _buildHomeContent() : _buildLogList(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Log List'),
        ],
        currentIndex: selectedIndex,
        onTap: (index) {
          if (index == 1) {
            _showBottomSheet(
                context); // Open the bottom sheet when the Add button is pressed
          } else {
            _onItemTapped(index); // Navigate between tabs
          }
        },
      ),
    );
  }

  // Home Page content with Goal Target and Now Drank
  Widget _buildHomeContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Goal Target', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Card(
            child: ListTile(
              title: Text('Goal: 0 Glasses'),
              // You can set the goal dynamically here
              trailing: TextButton(
                onPressed: () {
                  // Edit Goal functionality
                },
                child: Text('Edit'),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text('Now Drank', style: TextStyle(fontWeight: FontWeight.bold)),
          Card(
            child: ListTile(
              title: Text(
                  'Drank: ${waterTracker.fold(0, (sum, log) => sum + log.onOfGlasses)} Glasses'),
            ),
          ),
        ],
      ),
    );
  }

  // Log List view showing all drink logs
  Widget _buildLogList() {
    return ListView.builder(
      itemCount: waterTracker.length,
      itemBuilder: (context, index) {
        final log = waterTracker[index];
        return Card(
          child: ListTile(
            title: Text('Drank ${log.onOfGlasses} glasses'),
            subtitle:
                Text('Date: ${log.dateTime.toLocal().toString().split(' ')[0]}'),
          ),
        );
      },
    );
  }
}
