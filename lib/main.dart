import 'package:bus_tracker/AppStateNotifier.dart';
import 'package:bus_tracker/History.dart';
import 'package:bus_tracker/Report.dart';
import 'package:bus_tracker/Settings.dart';
import 'package:bus_tracker/SignOut.dart';
import 'package:bus_tracker/ThemeForApp.dart';
import 'package:bus_tracker/Track.dart';
import 'package:bus_tracker/Ways.dart';
import 'package:bus_tracker/routes/Routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<AppStateNotifier>(
      create: (context) => AppStateNotifier(),
      child: BusTracker(),
    ),
  );
}

class BusTracker extends StatefulWidget {
  @override
  _BusTrackerState createState() => _BusTrackerState();
}

class _BusTrackerState extends State<BusTracker> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateNotifier>(
      builder: (BuildContext context, appState, Widget child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: appState.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          home: Track(),
          routes: {
            Routes.track: (context) => Track(),
            Routes.history: (context) => History(),
            Routes.settings: (context) => Settings(),
            Routes.ways: (context) => Ways(),
            Routes.signout: (context) => SignOut(),
            Routes.report: (context) => Report(),
          },
        );
      },
    );
  }
}
