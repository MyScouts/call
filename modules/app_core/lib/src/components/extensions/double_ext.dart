extension DoubleNullExt on double? {
  double get getNumberDouble {
    return this ?? 0;
  }
}
