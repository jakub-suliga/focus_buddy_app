// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pomodoro.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PomodoroAdapter extends TypeAdapter<Pomodoro> {
  @override
  final int typeId = 2;

  @override
  Pomodoro read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Pomodoro(
      totalSessions: fields[0] as int,
      completedSessions: fields[1] as int,
      workDurationMinutes: fields[2] as int,
      shortBreakMinutes: fields[3] as int,
      longBreakMinutes: fields[4] as int,
      status: fields[5] as PomodoroStatus,
      remainingTimeSeconds: fields[6] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Pomodoro obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.totalSessions)
      ..writeByte(1)
      ..write(obj.completedSessions)
      ..writeByte(2)
      ..write(obj.workDurationMinutes)
      ..writeByte(3)
      ..write(obj.shortBreakMinutes)
      ..writeByte(4)
      ..write(obj.longBreakMinutes)
      ..writeByte(5)
      ..write(obj.status)
      ..writeByte(6)
      ..write(obj.remainingTimeSeconds);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PomodoroAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PomodoroStatusAdapter extends TypeAdapter<PomodoroStatus> {
  @override
  final int typeId = 1;

  @override
  PomodoroStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return PomodoroStatus.stopped;
      case 1:
        return PomodoroStatus.running;
      case 2:
        return PomodoroStatus.paused;
      default:
        return PomodoroStatus.stopped;
    }
  }

  @override
  void write(BinaryWriter writer, PomodoroStatus obj) {
    switch (obj) {
      case PomodoroStatus.stopped:
        writer.writeByte(0);
        break;
      case PomodoroStatus.running:
        writer.writeByte(1);
        break;
      case PomodoroStatus.paused:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PomodoroStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
