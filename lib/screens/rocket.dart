import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logintest/widget/list_info.dart';
import 'package:provider/provider.dart';

import '../model/rocket_model.dart';
import '../provider/launch_provider.dart';
import '../widget/drawer.dart';

class RocketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<LaunchProvider>(context).bloc;
    return Scaffold(
        drawer: AppDrawer(isHome: false),
        appBar: AppBar(
          title: Text(
            'All Rockets',
            style: GoogleFonts.ubuntu(),
          ),
          centerTitle: true,
        ),
        body: StreamBuilder<List<Rocket>>(
            stream: bloc.listRocket,
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Container();

              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListInfo(
                    nameTitle: 'Rocket name: ',
                    nameSubtitle: 'First flight: ',
                    infoTitle: snapshot.data[index].rocketName,
                    infosubtitle: snapshot.data[index].firstFlight,
                    isLaunchpad: false,
                  );
                },
              );
            }));
  }
}
