// lib/src/models/pomodoro.dart

import 'package:hive/hive.dart';

part 'pomodoro.g.dart';

@HiveType(typeId: 1)
enum PomodoroStatus {
  @HiveField(0)
  stopped,
  @HiveField(1)
  running,
  @HiveField(2)
  paused,
}

@HiveType(typeId: 2)
class Pomodoro {
  @HiveField(0)
  final int totalSessions;

  @HiveField(1)
  int completedSessions;

  @HiveField(2)
  final int workDurationMinutes;

  @HiveField(3)
  final int shortBreakMinutes;

  @HiveField(4)
  final int longBreakMinutes;

  @HiveField(5)
  PomodoroStatus status;

  @HiveField(6)
  int remainingTimeSeconds;

  Pomodoro({
    this.totalSessions = 4,
    this.completedSessions = 0,
    this.workDurationMinutes = 25,
    this.shortBreakMinutes = 5,
    this.longBreakMinutes = 15,
    this.status = PomodoroStatus.stopped,
    int? remainingTimeSeconds,
  }) : remainingTimeSeconds = remainingTimeSeconds ?? (25 * 60);

  Duration get workDuration => Duration(minutes: workDurationMinutes);
  Duration get shortBreak => Duration(minutes: shortBreakMinutes);
  Duration get longBreak => Duration(minutes: longBreakMinutes);
  Duration get remainingTime => Duration(seconds: remainingTimeSeconds);

  void reset() {
    status = PomodoroStatus.stopped;
    remainingTimeSeconds = workDurationMinutes * 60;
    completedSessions = 0;
  }
}
