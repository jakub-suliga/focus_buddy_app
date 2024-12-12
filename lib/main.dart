// lib/main.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'src/routes/app_routes.dart';
import 'src/providers/todo_provider.dart';
import 'src/providers/pomodoro_provider.dart';
import 'src/providers/noise_provider.dart';
import 'src/services/notification_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'src/models/todo.dart';
import 'src/models/pomodoro.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialisiere Hive
  await Hive.initFlutter();

  // Registrierung der Adapter
  Hive.registerAdapter(TodoAdapter());
  Hive.registerAdapter(PomodoroStatusAdapter());
  Hive.registerAdapter(PomodoroAdapter());

  // Initialisiere Benachrichtigungen
  final notificationService = NotificationService();
  await notificationService.init();

  // Fordere Mikrofonberechtigung an
  var status = await Permission.microphone.status;
  if (!status.isGranted) {
    await Permission.microphone.request();
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TodoProvider()),
        ChangeNotifierProvider(create: (_) => PomodoroProvider()),
        ChangeNotifierProvider(create: (_) => NoiseProvider()),
        // Weitere Provider hier
      ],
      child: MaterialApp(
        title: 'Focus Body',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: AppRoutes.home,
        routes: AppRoutes.routes,
      ),
    );
  }
}
