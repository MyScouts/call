class MediaFile {
  final String path;

  final String? extension;

  /// Size in bytes.
  final int size;

  final num width;

  final num height;

  MediaFile({
    required this.path,
    this.extension,
    this.size = 0,
    this.width = 0,
    this.height = 0,
  });
}