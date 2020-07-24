import 'package:bus_tracker/AppStateNotifier.dart';
import 'package:bus_tracker/TheDrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  static const String routeName = '/settings';
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    var isDark =
        Provider.of<AppStateNotifier>(context, listen: false).isDarkMode;
    return new Scaffold(
      key: _scaffoldKey,
      drawer: TheDrawer(),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: isDark ? Colors.white : Colors.black,
          ),
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
        title: Text(
          'Bus Tracker',
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: Row(
        children: [
          Text(
            'Settings',
            style: TextStyle(
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
