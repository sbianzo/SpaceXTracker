import 'package:flutter/material.dart';

import '../main.dart';
import '../screens/mission.dart';
import '../screens/rocket.dart';
import '../screens/launchpad.dart';
import '../screens/info_company.dart';

class AppDrawer extends StatelessWidget {
  final bool isHome;

  AppDrawer({this.isHome});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          isHome == false
              ? ListTile(
                  title: Text(
                    'Home',
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Home()));
                  },
                )
              : Container(),
          ListTile(
            title: Text(
              'Rockets',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => RocketScreen()));
            },
          ),
          ListTile(
            title: Text(
              'Missions',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MissionScreen()));
            },
          ),
          ListTile(
            title: Text(
              'Launchpads',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => LaunchpadScreen()));
            },
          ),
          Divider(height: 1),
          ListTile(
            title: Text(
              'Info',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => InfoCompany()));
            },
          ),
        ],
      ),
    );
  }
}
