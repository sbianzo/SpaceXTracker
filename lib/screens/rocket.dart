import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logintest/model/rocket_model.dart';
import 'package:logintest/provider/launch_provider.dart';
import 'package:logintest/widget/drawer.dart';
import 'package:provider/provider.dart';

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
        body: StreamBuilder<List<RocketA>>(
            stream: bloc.listRocket,
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Container();
              print('lunghezz<aaaa ' + snapshot.data.length.toString());

              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(snapshot.data[index].rocketName),
                  );
                },
              );
            }));
  }
}
