import 'package:bus_tracker/constants.dart';
import 'package:flutter/material.dart';

void main() => runApp(BusTracker());

class BusTracker extends StatefulWidget {
  @override
  _BusTrackerState createState() => _BusTrackerState();
}

class _BusTrackerState extends State<BusTracker> {
  void viewActions(String choice) {
    print('Working');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        backgroundColor: Colors.black,
      ),
      home: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Bus Tracker'),
            backgroundColor: Colors.blueAccent,
            bottom: TabBar(
              tabs: [
                Tab(
                  text: 'Track',
                ),
                Tab(
                  text: 'History',
                ),
                Tab(
                  text: 'Routes',
                ),
              ],
            ),
            actions: <Widget>[
              PopupMenuButton<String>(
                onSelected: viewActions,
                itemBuilder: (BuildContext context) {
                  return Constants.choices.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
