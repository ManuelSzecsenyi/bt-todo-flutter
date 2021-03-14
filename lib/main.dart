import 'package:flutter/material.dart';
import 'package:to_do/components/header.dart';
import 'package:to_do/components/navbar/MenuBtn.dart';
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
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: MainScreen(),
          )
        )
      )
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(child: Navbar()),
        Header()
      ]
    );
  }

}




