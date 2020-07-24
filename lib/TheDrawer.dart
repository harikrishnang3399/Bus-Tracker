import 'package:bus_tracker/AppStateNotifier.dart';
import 'package:bus_tracker/routes/Routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TheDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var isDark =
        Provider.of<AppStateNotifier>(context, listen: false).isDarkMode;
    return SafeArea(
      child: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Harikrishnan G'),
              accountEmail: Text('hari.krishnan.g.0303@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.blue,
                backgroundImage: AssetImage('images/hari.png'),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.location_on,
                color: Colors.teal,
              ),
              title: Text(
                'Track',
                textScaleFactor: 1.5,
                style: TextStyle(
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, Routes.track);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.history,
                color: Colors.brown,
              ),
              title: Text(
                'History',
                textScaleFactor: 1.5,
                style: TextStyle(
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, Routes.history);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.map,
                color: Colors.blue,
              ),
              title: Text(
                'Routes',
                textScaleFactor: 1.5,
                style: TextStyle(
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, Routes.ways);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.blueGrey[400],
              ),
              title: Text(
                'Settings',
                textScaleFactor: 1.5,
                style: TextStyle(
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, Routes.settings);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.red,
              ),
              title: Text(
                'Sign Out',
                textScaleFactor: 1.5,
                style: TextStyle(
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, Routes.signout);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.brightness_6,
                color: isDark ? Colors.white : Colors.black,
              ),
              title: Text(
                'Dark Mode',
                textScaleFactor: 1.5,
                style: TextStyle(
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
              trailing: Switch.adaptive(
                value: Provider.of<AppStateNotifier>(context, listen: false)
                    .isDarkMode,
                onChanged: (boolVal) {
                  Provider.of<AppStateNotifier>(context, listen: false)
                      .updateTheme(boolVal);
                },
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.bug_report,
                color: Colors.green,
              ),
              title: Text(
                'Report Issue',
                textScaleFactor: 1.5,
                style: TextStyle(
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, Routes.report);
              },
            ),
          ],
        ),
      ),
    );
  }
}
