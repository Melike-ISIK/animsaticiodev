import 'package:flutter/material.dart';
import 'package:animsaticilar/app_theme.dart';


// import Screens

import 'todo2.dart';
import 'create_todo.dart';

class TodoAPP extends StatelessWidget {
  TodoAPP({Key key}) : super(key: key);

  Map<String, WidgetBuilder> _buildRoutes() {
    final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
      '/': (context) => TodoPage(),
      CreateTodoPage.routeName: (context) => CreateTodoPage(),
    };

    return routes;
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      routes: _buildRoutes(),
    );
  }
}