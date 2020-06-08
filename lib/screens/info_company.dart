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

              return Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: <Widget>[
                    _buildRowText(
                        context, 'Name company', snapshot.data.name, false),
                    _buildRowText(
                        context, 'Name founder', snapshot.data.founder, false),
                    _buildRowText(context, 'Founded year',
                        snapshot.data.yearFounded.toString(), false),
                    _buildRowText(context, 'Number of employees',
                        snapshot.data.employees.toString(), false),
                    _buildRowText(
                        context, 'Summary', snapshot.data.summary, true),
                    _buildRowText(
                        context, 'Twitter', snapshot.data.links.twitter, false),
                  ],
                ),
              );
            }));
  }

  Widget _buildRowText(
      BuildContext context, String name, String info, bool isSummary) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        height: isSummary ? 130 : 50,
        width: MediaQuery.of(context).size.width,
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$name:   ',
              style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.orange),
            ),
            Flexible(
              child: Text(
                info,
                style: GoogleFonts.lato(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        )),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.grey[700]),
      ),
    );
  }
}
