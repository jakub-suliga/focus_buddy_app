// lib/src/routes/app_routes.dart

import 'package:flutter/material.dart';
import '../screens/home/home_screen.dart';
import '../screens/todo/todo_screen.dart';
import '../screens/todo/add_todo_screen.dart';
import '../screens/pomodoro/pomodoro_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String todo = '/todo';
  static const String addTodo = '/add_todo';
  static const String pomodoro = '/pomodoro';

  static Map<String, WidgetBuilder> get routes {
    return {
      home: (context) => HomeScreen(),
      todo: (context) => TodoScreen(),
      addTodo: (context) => AddTodoScreen(),
      pomodoro: (context) => PomodoroScreen(),
    };
  }
}
