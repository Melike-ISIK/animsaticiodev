import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animsaticilar/todo.dart';

import 'app.dart';

void main() => runApp(
  ChangeNotifierProvider.value(
    value: Todos(),
    child: TodoAPP(),
  ),
);
class TodoApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Container(
          child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(),
                  flex: 1,
                ),
              ]
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Background.png'),
                fit: BoxFit.cover
            ),
          ),
        ),
      ),
    );
  }
}