extension Separated<T> on List<T> {
  List<T> separated(T value) {
    final result = <T>[];
    for (int i = 0; i < length; i++) {
      if (i == 0) {
        result.add(this[i]);
      } else {
        result.add(value);
        result.add(this[i]);
      }
    }
    return result;
  }
}