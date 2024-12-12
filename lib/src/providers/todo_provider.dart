// lib/src/providers/todo_provider.dart

import 'package:flutter/material.dart';
import '../models/todo.dart';
import '../services/storage_service.dart';

class TodoProvider with ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  TodoProvider() {
    _loadTodos();
  }

  Future<void> _loadTodos() async {
    _todos = await StorageService.getTodos();
    notifyListeners();
  }

  void addTodo(Todo todo) {
    _todos.add(todo);
    StorageService.saveTodos(_todos);
    notifyListeners();
  }

  void removeTodo(String id) {
    _todos.removeWhere((todo) => todo.id == id);
    StorageService.saveTodos(_todos);
    notifyListeners();
  }

  void toggleTodoStatus(String id) {
    final todo = _todos.firstWhere((todo) => todo.id == id);
    todo.isCompleted = !todo.isCompleted;
    StorageService.saveTodos(_todos);
    notifyListeners();
  }
}
