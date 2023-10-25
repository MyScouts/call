extension IntDateExt on int? {
  Duration get timeToNow =>
      DateTime.now().difference(DateTime.fromMillisecondsSinceEpoch(
              this ?? DateTime.now().millisecondsSinceEpoch)
          .toLocal());
}
