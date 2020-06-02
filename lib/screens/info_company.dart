import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../model/info_model.dart';
import '../provider/launch_provider.dart';
import '../widget/drawer.dart';

class InfoCompany extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<LaunchProvider>(context).bloc;
    return Scaffold(
        drawer: AppDrawer(isHome: false),
        appBar: AppBar(
          title: Text(
            'Info Company',
            style: GoogleFonts.ubuntu(),
          ),
          centerTitle: true,
        ),
        body: StreamBuilder<Info>(
            stream: bloc.infoCompany,
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Container();

              return Column(
                children: <Widget>[
                  Text('Name Company: ' + snapshot.data.name),
                  Text('Name Founder:' + snapshot.data.founder),
                  Text('Founded Year: ' + snapshot.data.yearFounded.toString()),
                  Text('Number of Employees: ' +
                      snapshot.data.employees.toString()),
                  Text('Summary: ' + snapshot.data.summary),
                  Text('Twitter: ' + snapshot.data.links.twitter),
                ],
              );
            }));
  }
}
