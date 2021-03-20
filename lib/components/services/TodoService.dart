import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:to_do/models/Todo.dart';

class TodoService {
  static Future<List<Todo>> fetchTodos() async {
    final response = await http.get(Uri.http('10.0.2.2:3000', ''));

    if(response.statusCode == 200){
      return todoFromJson(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load todos');
    }
  }
}