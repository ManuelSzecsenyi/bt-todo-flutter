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
  Timer timer = Timer.periodic(Duration(seconds: 1), (Timer t) => { });

  @override
  void initState() {
    super.initState();
    TodoService.fetchTodos();
    todoList = TodoService.todoItems;
    timer = Timer.periodic(Duration(seconds: 4), (Timer t) => checkForNewTodos());
  }

  void checkForNewTodos() {
    setState(() {
      TodoService.fetchTodos();
      todoList = TodoService.todoItems;
      log("new items fetched");
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
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
                  TodoService.fetchTodos();
                });
              },
              child: TodoItem(todoList[index]),
            )
        );
      },
    );
  }
}


