import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:to_do/models/NewTodo.dart';
import 'package:to_do/models/Todo.dart';

class TodoService {

  static final String API_URL = "10.0.2.2:3000";

  static List<Todo> todoItems = [];

  TodoService._privateConstructor();

  static final TodoService _instance = TodoService._privateConstructor();

  factory TodoService() {
    return _instance;
  }

  static addTodo(String text) async {
    final NewTodo todoToSend = NewTodo(text: text, done: false);
    final response = await http.post(
      Uri.http(API_URL, ''),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(todoToSend)
    );

    if(response.statusCode != 201){
      throw Exception("Unable to add save data");
    } else {
      fetchTodos();
    }
  }

  static toggleTodo(Todo todoItem) async {
    final response = await http.put(
      Uri.http(API_URL, ''),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(todoItem)
    );

    if(response.statusCode != 200){
      throw Exception("Unable to update data");
    }
  }

  static void fetchTodos() async {
    final response = await http.get(Uri.http(API_URL, ''));

    if(response.statusCode == 200){
      log("Fetched todos from server");
      TodoService.todoItems = todoFromJson(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load todos');
    }
  }
}