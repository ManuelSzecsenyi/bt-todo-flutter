import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';



class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {

  String todayString = "";

  @override
  void initState() {
    initializeDateFormatting("de", null).then((_) {
      final now = DateTime.now();
      final formatter = DateFormat("E dd.MM.yy", 'de');

      setState(() {
        todayString = formatter.format(now);
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            todayString,
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

