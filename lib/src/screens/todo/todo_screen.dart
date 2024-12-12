// lib/src/screens/todo/todo_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/todo_provider.dart';
import '../../widgets/todo_item.dart';
import 'add_todo_screen.dart';

class TodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);
    final todos = todoProvider.todos;

    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo Liste'),
      ),
      body: todos.isEmpty
          ? Center(child: Text('Keine ToDos vorhanden.'))
          : ListView.builder(
              itemCount: todos.length,
              itemBuilder: (ctx, index) => TodoItem(todo: todos[index]),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (ctx) => AddTodoScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
