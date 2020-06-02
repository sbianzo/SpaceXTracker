import 'package:flutter/material.dart';

import '../main.dart';
import '../screens/mission.dart';
import '../screens/rocket.dart';

class AppDrawer extends StatelessWidget {
  final bool isHome;

  AppDrawer({this.isHome});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: Column(
          children: <Widget>[
            isHome == false
                ? ListTile(
                    title: Text(
                      'Home',
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Home()));
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
                'Other',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
