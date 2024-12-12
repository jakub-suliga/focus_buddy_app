// lib/src/providers/pomodoro_provider.dart

import 'dart:async';
import 'package:flutter/material.dart';
import '../models/pomodoro.dart';
import '../services/notification_service.dart';

class PomodoroProvider with ChangeNotifier {
  Pomodoro _pomodoro = Pomodoro();
  Timer? _timer;
  final NotificationService _notificationService = NotificationService();

  Pomodoro get pomodoro => _pomodoro;

  void start() {
    if (_pomodoro.status == PomodoroStatus.running) return;

    _pomodoro.status = PomodoroStatus.running;
    _startTimer();
    notifyListeners();
  }

  void pause() {
    if (_pomodoro.status != PomodoroStatus.running) return;

    _pomodoro.status = PomodoroStatus.paused;
    _timer?.cancel();
    notifyListeners();
  }

  void resume() {
    if (_pomodoro.status != PomodoroStatus.paused) return;

    _pomodoro.status = PomodoroStatus.running;
    _startTimer();
    notifyListeners();
  }

  void reset() {
    _timer?.cancel();
    _pomodoro.reset();
    notifyListeners();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_pomodoro.remainingTimeSeconds > 0) {
        _pomodoro.remainingTimeSeconds -= 1;
      } else {
        _timer?.cancel();
        _handleSessionCompletion();
      }
      notifyListeners();
    });
  }

  void _handleSessionCompletion() {
    if (_pomodoro.status == PomodoroStatus.running) {
      _notificationService.showNotification(
        title: 'Session beendet',
        body: _getSessionEndMessage(),
      );

      _pomodoro.completedSessions += 1;
      if (_pomodoro.completedSessions % _pomodoro.totalSessions == 0) {
        _pomodoro.remainingTimeSeconds = _pomodoro.longBreakMinutes * 60;
        _notificationService.showNotification(
          title: 'Lange Pause',
          body: 'Zeit für eine lange Pause!',
        );
      } else {
        _pomodoro.remainingTimeSeconds = _pomodoro.shortBreakMinutes * 60;
        _notificationService.showNotification(
          title: 'Kurze Pause',
          body: 'Zeit für eine kurze Pause!',
        );
      }
      _pomodoro.status = PomodoroStatus.stopped;
    }
  }

  String _getSessionEndMessage() {
    if (_pomodoro.completedSessions % _pomodoro.totalSessions == 0) {
      return 'Zeit für eine lange Pause!';
    } else {
      return 'Zeit für eine kurze Pause!';
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
