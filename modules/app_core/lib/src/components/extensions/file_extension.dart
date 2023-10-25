import 'dart:io';

extension FileExt on File {
  Future<double> get getSizeMb async {
    final sizeInBytes = await length();
    return sizeInBytes / (1024 * 1024);
  }
}
