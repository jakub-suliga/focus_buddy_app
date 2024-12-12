// lib/src/models/noise_level.dart

class NoiseLevel {
  final DateTime timestamp;
  final double decibel;

  NoiseLevel({required this.timestamp, required this.decibel});

  // Optional: Methoden zur Konvertierung von und zu JSON, falls benötigt
  factory NoiseLevel.fromJson(Map<String, dynamic> json) {
    return NoiseLevel(
      timestamp: DateTime.parse(json['timestamp']),
      decibel: json['decibel'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'timestamp': timestamp.toIso8601String(),
      'decibel': decibel,
    };
  }
}
