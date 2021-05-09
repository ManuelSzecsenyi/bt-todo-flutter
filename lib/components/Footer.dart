import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:to_do/components/services/TodoService.dart';

class Footer extends StatefulWidget {

  final void Function(String) onAdd;
  const Footer(this.onAdd);

  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {

  TextEditingController todoTextController = new TextEditingController();

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
            Expanded(
              child: TextField(
                controller: todoTextController,
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
              )
            ),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: InkWell(
                onTap: () {
                  setState(() {
                    TodoService.addTodo(todoTextController.text);
                    todoTextController.clear();
                  });
                },
               child: Image(image: AssetImage("assets/save-btn.png")),
              )
            )
          ],)
        ),
      ),
    );
  }
}