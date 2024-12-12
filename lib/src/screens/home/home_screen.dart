// lib/src/screens/home/home_screen.dart

import 'package:flutter/material.dart';
import '../todo/todo_screen.dart';
import '../pomodoro/pomodoro_screen.dart';
import '../../widgets/noise_indicator.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Focus Body'),
      ),
      body: Column(
        children: [
          NoiseIndicator(),
          Expanded(
            child: Center(
              child: Text('Willkommen bei Focus Body!'),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text('Focus Body', style: TextStyle(fontSize: 24, color: Colors.white)),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('ToDo Liste'),
              onTap: () {
                Navigator.of(context).pushNamed('/todo');
              },
            ),
            ListTile(
              leading: Icon(Icons.timer),
              title: Text('Pomodoro Timer'),
              onTap: () {
                Navigator.of(context).pushNamed('/pomodoro');
              },
            ),
          ],
        ),
      ),
    );
  }
}
