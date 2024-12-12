// lib/src/services/storage_service.dart

import 'package:hive/hive.dart';
import '../models/todo.dart';
import '../models/noise_level.dart';

class StorageService {
  static const String todoBoxName = 'todos';
  static const String noiseBoxName = 'noise_levels';

  // ToDo-Methoden
  static Future<void> saveTodos(List<Todo> todos) async {
    final box = await Hive.openBox<Todo>(todoBoxName);
    await box.clear();
    for (var todo in todos) {
      await box.put(todo.id, todo);
    }
  }

  static Future<List<Todo>> getTodos() async {
    final box = await Hive.openBox<Todo>(todoBoxName);
    return box.values.toList().cast<Todo>();
  }

  // NoiseLevel-Methoden (optional)
  static Future<void> saveNoiseLevels(List<NoiseLevel> noiseLevels) async {
    final box = await Hive.openBox<NoiseLevel>(noiseBoxName);
    await box.clear();
    for (var noise in noiseLevels) {
      await box.put(noise.timestamp.toIso8601String(), noise);
    }
  }

  static Future<List<NoiseLevel>> getNoiseLevels() async {
    final box = await Hive.openBox<NoiseLevel>(noiseBoxName);
    return box.values.toList().cast<NoiseLevel>();
  }
}
