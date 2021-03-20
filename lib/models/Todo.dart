import 'dart:convert';

import 'package:uuid/uuid.dart';

/*

https://app.quicktype.io/

 */


List<Todo> todoFromJson(String str) => List<Todo>.from(json.decode(str).map((x) => Todo.fromJson(x)));

String todoToJson(List<Todo> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Todo {
  Todo({
    required this.id,
    required this.text,
    required this.done,
    required this.createdAt,
  });

  String id;
  String text;
  bool done;
  DateTime createdAt;

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
    id: json["id"],
    text: json["text"],
    done: json["done"],
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "text": text,
    "done": done,
    "createdAt": createdAt.toIso8601String(),
  };
}

