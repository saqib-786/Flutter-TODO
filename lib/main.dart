import 'package:flutter/material.dart';
import 'package:todo/Home.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('TODO APP'),),
        body: TODO(),
      ),
    );
  }
}
