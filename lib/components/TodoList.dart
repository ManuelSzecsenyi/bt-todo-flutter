import 'dart:convert';
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

  late Future<List<Todo>> futureTodoList;

  @override
  void initState() {
    super.initState();
    futureTodoList = TodoService.fetchTodos();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futureTodoList,
        builder: (context, snapshot) {
          if(snapshot.hasData == null){
            return Container();
          }
          return TodoListView(todoList: snapshot.data as List<Todo>);
        }
    );
  }
}

class TodoListView extends StatelessWidget {
  final List<Todo> todoList;

  TodoListView({required this.todoList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todoList.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: TodoItem(todoList[index]),
        );
      },
    );
  }
}

