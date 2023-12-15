class MediaFile {
  final String path;

  final String? extension;

  /// Size in bytes.
  final int size;

  final num width;

  final num height;

  final Duration videoDuration;

  MediaFile({
    required this.path,
    this.extension,
    this.size = 0,
    this.width = 0,
    this.height = 0,
    this.videoDuration = const Duration(),
  });
}