import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/components/navbar/MenuBtn.dart';
import 'package:to_do/components/navbar/ProfileImage.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      MenuBtn(),
      Spacer(),
      Text(
        "ToDo",
        style: GoogleFonts.roboto(
          textStyle: TextStyle(fontSize: 26, fontWeight: FontWeight.w500)
        ),
      ),
      Spacer(),
      ProfileImage()
    ]);
  }
}
