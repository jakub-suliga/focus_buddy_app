// lib/src/widgets/todo_item.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/todo.dart';
import '../providers/todo_provider.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  TodoItem({required this.todo});

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context, listen: false);

    return ListTile(
      leading: Checkbox(
        value: todo.isCompleted,
        onChanged: (value) {
          todoProvider.toggleTodoStatus(todo.id);
        },
      ),
      title: Text(
        todo.title,
        style: TextStyle(
          decoration:
              todo.isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          todoProvider.removeTodo(todo.id);
        },
      ),
    );
  }
}
