import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
                  return ListTile(
                    title: Text(snapshot.data[index].rocketName),
                    contentPadding: EdgeInsets.all(5),
                    subtitle: Text(snapshot.data[index].firstFlight),
                  );
                },
              );
            }));
  }
}
