// lib/src/services/audio_service.dart

import 'package:noise_meter/noise_meter.dart';
import 'dart:async';

class AudioService {
  late NoiseMeter _noiseMeter;
  bool _isRecording = false;
  StreamSubscription<NoiseReading>? _subscription;
  Function(double)? _onNoiseLevel;

  void startListening(Function(double) onNoiseLevel) {
    _onNoiseLevel = onNoiseLevel;
    _noiseMeter = NoiseMeter(); // Konstruktor ohne Argumente
    _isRecording = true;

    _subscription = _noiseMeter.noise.listen((NoiseReading noiseReading) {
      if (_isRecording && _onNoiseLevel != null) {
        _onNoiseLevel!(noiseReading.meanDecibel);
      }
    }, onError: (error) {
      // Fehlerbehandlung
      print("Fehler im Noise Meter: $error");
      _isRecording = false;
    });
  }

  void stopListening() {
    _isRecording = false;
    _subscription?.cancel();
  }
}
