// lib/src/screens/todo/add_todo_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart'; // Import hinzugefügt
import '../../providers/todo_provider.dart';
import '../../models/todo.dart';

class AddTodoScreen extends StatefulWidget {
  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      final newTodo = Todo(
        id: Uuid().v4(), // Uuid() ist jetzt definiert
        title: _title,
      );
      Provider.of<TodoProvider>(context, listen: false).addTodo(newTodo);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Neues ToDo hinzufügen'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'ToDo Titel'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Bitte einen Titel eingeben';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _title = value ?? '';
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _submit,
                    child: Text('Hinzufügen'),
                  )
                ],
              )),
        ));
  }
}
