import 'package:flutter/material.dart';
import 'package:to_do/components/TodoItem.dart';
import 'package:to_do/models/Todo.dart';
import 'package:uuid/uuid.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {

    /**
     * TODO add here API-service things
     */
    final todos = List<Todo>.generate(
      20,
          (i) => Todo(
            Uuid(),
            'Todo $i',
            false
          ),
        );

    return ListView.builder(
      itemCount: todos.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return ListTile(
          title: TodoItem()
        );
      },
    );
  }
}

//https://flutter.dev/docs/cookbook/navigation/passing-data
