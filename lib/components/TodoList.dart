import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:to_do/components/TodoItem.dart';
import 'package:to_do/components/services/TodoService.dart';
import 'package:to_do/models/Todo.dart';


class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {

  List<Todo> todoList = [];

  @override
  void initState() {
    super.initState();
    checkForNewTodos();
    log("init");
  }

  void checkForNewTodos() {
    setState(() {
      TodoService.fetchTodos().then((value) => this.todoList = value);
      todoList = TodoService.todoItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todoList.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: InkWell(
              onTap: () {
                setState(() {
                  todoList[index].done = !todoList[index].done;
                  TodoService.toggleTodo(todoList[index]);
                });
              },
              child: TodoItem(todoList[index]),
            )
        );
      },
    );
  }
}


