import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:to_do/components/Footer.dart';
import 'package:to_do/components/TodoItem.dart';
import 'package:to_do/components/header.dart';
import 'package:to_do/components/navbar/Navbar.dart';
import 'package:uuid/uuid.dart';

import 'components/services/TodoService.dart';
import 'models/Todo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: SafeArea(
          child: MainScreen()
        )
      )
    );
  }
}

class MainScreen extends StatefulWidget {

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Todo> todoList = [];

  @override
  void initState() {
    super.initState();
    getTodos();
    log("init");
  }

  void getTodos() {
    setState(() {
      TodoService.fetchTodos().then((value) => this.todoList = value);
      todoList = TodoService.todoItems;
    });
  }

  void addTodo(String text) {
    TodoService.addTodo(text);
    setState(() {
      this.todoList.add(new Todo(id: new Uuid().toString(), text: text, done: false, createdAt: DateTime.now()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Navbar(),
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 20),
                    child: Header()
                ),
                Expanded(
                    child: ListView.builder(
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
                    ),
                ),
                Container(
                  height: 60, // Because of the Positioned footer
                )
              ]
          ),
        ),
        new Positioned(
            left: 0.0,
            bottom: 0.0,
            child: Footer(this.addTodo)
        )
      ],
    );
  }
}




