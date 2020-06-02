import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/mission_model.dart';
import '../provider/launch_provider.dart';
import '../widget/drawer.dart';

class MissionScreen extends StatelessWidget {
  Future<void> _launchInWebViewWithJavaScript(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        enableJavaScript: true,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<LaunchProvider>(context).bloc;
    return Scaffold(
      drawer: AppDrawer(isHome: false),
      appBar: AppBar(
        title: Text(
          'All Missions',
          style: GoogleFonts.ubuntu(),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<List<Mission>>(
          stream: bloc.listMission,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Container();

            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(snapshot.data[index].missionName),
                  contentPadding: EdgeInsets.all(5),
                  subtitle: RaisedButton(
                      onPressed: () {
                        _launchInWebViewWithJavaScript(
                            snapshot.data[index].wiki);
                      },
                      child: Text(snapshot.data[index].wiki)),
                );
              },
            );
          }),
    );
  }
}
