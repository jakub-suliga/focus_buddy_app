// lib/src/screens/pomodoro/pomodoro_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/pomodoro_provider.dart';
import '../../widgets/pomodoro_timer.dart';
import '../../models/pomodoro.dart';

class PomodoroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pomodoroProvider = Provider.of<PomodoroProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Pomodoro Timer'),
      ),
      body: Center(
        child: PomodoroTimer(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          switch (pomodoroProvider.pomodoro.status) {
            case PomodoroStatus.stopped:
              pomodoroProvider.start();
              break;
            case PomodoroStatus.running:
              pomodoroProvider.pause();
              break;
            case PomodoroStatus.paused:
              pomodoroProvider.resume();
              break;
          }
        },
        child: Icon(
          pomodoroProvider.pomodoro.status == PomodoroStatus.running
              ? Icons.pause
              : pomodoroProvider.pomodoro.status == PomodoroStatus.paused
                  ? Icons.play_arrow
                  : Icons.play_arrow,
        ),
      ),
    );
  }
}
