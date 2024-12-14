// lib/src/providers/noise_provider.dart

import 'package:flutter/material.dart';
import '../services/audio_service.dart';
import '../services/notification_service.dart';

class NoiseProvider with ChangeNotifier {
  final AudioService _audioService = AudioService();
  final NotificationService _notificationService = NotificationService();

  double _currentNoiseLevel = 0.0;
  bool _isLoud = false;

  double get currentNoiseLevel => _currentNoiseLevel;
  bool get isLoud => _isLoud;

  NoiseProvider() {
    _audioService.startListening(_onNoiseLevelChanged);
  }

  void _onNoiseLevelChanged(double decibel) {
    _currentNoiseLevel = decibel;
    _isLoud = decibel > 70.0; // Beispielschwelle für Lärm
    notifyListeners();

    if (_isLoud) {
      _notificationService.showNotification(
        title: 'Laut in deiner Umgebung',
        body: 'Bitte finde einen ruhigeren Ort zum Lernen.',
      );
    } else {
      // Optional: Benachrichtigung, wenn die Lautstärke wieder normal ist
    }
  }

  @override
  void dispose() {
    _audioService.stopListening();
    super.dispose();
  }
}
