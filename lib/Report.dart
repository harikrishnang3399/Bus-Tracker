import 'package:bus_tracker/AppStateNotifier.dart';
import 'package:bus_tracker/TheDrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Report extends StatefulWidget {
  static const String routeName = '/report';
  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
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
            'Report',
            style: TextStyle(
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
