import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListInfo extends StatelessWidget {
  final String nameTitle;
  final String nameSubtitle;
  final String infoTitle;
  final String infosubtitle;
  final bool isLaunchpad;

  ListInfo({
    this.nameSubtitle,
    this.nameTitle,
    this.infoTitle,
    this.infosubtitle,
    this.isLaunchpad,
  });

  @override
  Widget build(BuildContext context) {
    Color color;
    if (isLaunchpad) {
      switch (infosubtitle) {
        case 'retired':
          color = Colors.red;
          break;
        case 'active':
          color = Colors.green;
          break;
        case 'under construction':
          color = Colors.yellow;
          break;
      }
    }

    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: ListTile(
        title: Text(
          nameTitle + '   ' + infoTitle,
          style: GoogleFonts.lato(
              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.orange),
        ),
        contentPadding: EdgeInsets.all(5),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            children: <Widget>[
              Text(
                nameSubtitle + '   ',
                style: GoogleFonts.lato(fontWeight: FontWeight.bold),
              ),
              Text(
                infosubtitle + '   ',
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.bold,
                    color: isLaunchpad ? color : null),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
