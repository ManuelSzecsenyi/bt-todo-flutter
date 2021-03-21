import 'package:meta/meta.dart';
import 'dart:convert';

NewTodo newTodoFromJson(String str) => NewTodo.fromJson(json.decode(str));

String newTodoToJson(NewTodo data) => json.encode(data.toJson());

class NewTodo {
  NewTodo({
    required this.text,
    required this.done,
  });

  final String text;
  final bool done;

  factory NewTodo.fromJson(Map<String, dynamic> json) => NewTodo(
    text: json["text"],
    done: json["done"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "done": done,
  };
}
