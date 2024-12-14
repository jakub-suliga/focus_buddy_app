// lib/src/utils/helpers.dart


class Helpers {
  // Formatierung der verbleibenden Zeit für den Pomodoro-Timer
  static String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  // Weitere Hilfsfunktionen können hier hinzugefügt werden
}
