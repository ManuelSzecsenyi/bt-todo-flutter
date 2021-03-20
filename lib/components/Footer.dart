import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class Footer extends StatefulWidget {
  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 80,
      child: Container(
        decoration: BoxDecoration(color: HexColor("#698C99"), borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        )),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(children: [
            Expanded(child: TodoInput()),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Image(image: AssetImage("assets/save-btn.png"))
            )
          ],)
        ),
      ),
    );
  }
}


class TodoInput extends StatefulWidget {
  @override
  _TodoInputState createState() => _TodoInputState();
}

class _TodoInputState extends State<TodoInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: "Eine Aufgabe hinzufügen",
          hintStyle: GoogleFonts.roboto(fontSize: 17, color: Colors.white60),
          border: InputBorder.none
      ),
      cursorColor: Colors.white,
      style: GoogleFonts.roboto(
          fontSize: 17,
          color: Colors.white,
          decoration: TextDecoration.none
      ),
    );
  }
}
