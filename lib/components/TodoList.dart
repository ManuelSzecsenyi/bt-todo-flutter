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
    /**
     * TODO add here API-service things
     */
    final todos = List<Todo>.generate(
      10,
          (i) => Todo(
              id: "1",
              text: 'Todo $i',
              done: false,
              createdAt: new DateTime.now()
          ),
        );

    return FutureBuilder(
        future: futureTodoList,
        builder: (context, snapshot) {
          if(snapshot.hasData == null){
            return Container();
          }
          return ListView.builder(
            itemCount: 5, // TODO check here lenght and pass data
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: TodoItem(),
              );
            },
          );
        }
    );
  }
}

//https://flutter.dev/docs/cookbook/navigation/passing-data
