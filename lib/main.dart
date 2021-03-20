import 'package:flutter/material.dart';
import 'package:to_do/components/Footer.dart';
import 'package:to_do/components/TodoItem.dart';
import 'package:to_do/components/TodoList.dart';
import 'package:to_do/components/header.dart';
import 'package:to_do/components/navbar/Navbar.dart';

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

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(child: Navbar()),
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Header()
                ),
                Flexible(
                    flex: 2,
                    child: TodoList()
                )
              ]
          ),
        ),
        new Positioned(
            left: 0.0,
            bottom: 0.0,
            child: Footer()
        )
      ],
    );
  }

}




