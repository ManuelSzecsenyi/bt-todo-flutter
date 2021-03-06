import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:to_do/models/Todo.dart';

class TodoItem extends StatefulWidget {

  final Todo todo;
  const TodoItem(this.todo);



  @override
  _TodoItemState createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: HexColor("#F6F6F6"),
          borderRadius: BorderRadius.circular(5)
      ),
      child: Row(children: [
        (widget.todo.done ? Image(image: AssetImage("assets/item-checked.png")) : Image(image: AssetImage("assets/item-unchecked.png"))),
        SizedBox(width: 20),
        Text(
          widget.todo.text,
          style: GoogleFonts.roboto(fontSize: 17, decoration: (widget.todo.done ? TextDecoration.lineThrough : null)),
        )
      ]),
    );
  }
}
