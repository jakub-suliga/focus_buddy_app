// lib/src/widgets/pomodoro_timer.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/pomodoro_provider.dart';
import '../utils/helpers.dart';
import '../models/pomodoro.dart';

class PomodoroTimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pomodoroProvider = Provider.of<PomodoroProvider>(context);
    final pomodoro = pomodoroProvider.pomodoro;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          pomodoro.status == PomodoroStatus.running
              ? 'Arbeit'
              : pomodoro.status == PomodoroStatus.paused
                  ? 'Pause'
                  : 'Gestoppt',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Text(
          Helpers.formatDuration(pomodoro.remainingTime),
          style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Text(
          'Abgeschlossene Sitzungen: ${pomodoro.completedSessions}',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
