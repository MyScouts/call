import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart' show rootBundle;
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

abstract class StorageService {
  Future<File> saveTempFile(Uint8List data, String fileName);
  Future<String> getFilePath(String assetPath,
      [String package = 'packages/design_system']);

  Future<ByteData> getFileData(String path);
}

@Injectable(as: StorageService)
class StorageServiceImpl extends StorageService {
  @override
  Future<File> saveTempFile(Uint8List data, String fileName) async {
    final tempDir = await getTemporaryDirectory();
    final filePath = '${tempDir.path}/${fileName.split('/').last}';
    final file = File(filePath);

    if (await file.exists()) {
      await file.delete();
    }
    return file.writeAsBytes(
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
    );
  }

  @override
  Future<String> getFilePath(String assetPath,
      [String package = 'packages/design_system']) async {
    final tempDir = await getTemporaryDirectory();
    final localFile = '${tempDir.path}/${assetPath.split('/').last}';

    if (await File(localFile).exists()) {
      return localFile;
    }

    final data = await getFileData('$package/$assetPath');
    final file = await saveTempFile(
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
      assetPath,
    );

    return file.path;
  }

  @override
  Future<ByteData> getFileData(String path) async {
    return rootBundle.load(path);
  }
}
