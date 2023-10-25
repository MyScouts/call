extension DurationExt on Duration {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  String get hhmm {
    final twoDigitMinutes = twoDigits(inMinutes.remainder(60));
    return '${twoDigits(inHours)}:$twoDigitMinutes';
  }

  String get hhmmss {
    return toString().split('.').first.padLeft(8, '0');
  }

  String get mmss {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final twoDigitMinutes = twoDigits(inMinutes);
    final twoDigitSeconds = twoDigits(inSeconds.remainder(60));
    return '$twoDigitMinutes:$twoDigitSeconds';
  }
}
