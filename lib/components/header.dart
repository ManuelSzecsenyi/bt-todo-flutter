import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';


class Header extends StatelessWidget {
  
  final DateTime currentDate = new DateTime.now();
  final DateFormat formatter = DateFormat("E. dd.MM.yy");

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          formatter.format(currentDate),
          style: GoogleFonts.roboto(
            textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 34)
          )
        ),
        Container(
          margin: EdgeInsets.only(top: 15),
          child: Text(
              "Meine Aufgaben",
              style: GoogleFonts.roboto(
                textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 19)
              )
          ),
        )
      ],
    );
  }
}
