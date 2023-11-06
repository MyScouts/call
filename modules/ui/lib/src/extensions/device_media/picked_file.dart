import 'dart:io';

import 'package:file_picker/file_picker.dart' as f_picker;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:universal_platform/universal_platform.dart';

extension BuildContextExtFile on BuildContext {
  Future<T?> pickedFile<T>({
    List<String>? extensions,
    String? initialDirectory,
    bool isImage = false,
    bool allowMultiple = false,
  }) async {
    if (UniversalPlatform.isIOS || UniversalPlatform.isAndroid) {
      try {
        final files = await f_picker.FilePicker.platform.pickFiles(
          allowMultiple: allowMultiple,
          allowedExtensions: isImage ? null : extensions,
          initialDirectory: initialDirectory,
          type: isImage ? f_picker.FileType.image : f_picker.FileType.any,
        );

        if (files != null) {
          if (allowMultiple) {
            return files.files.map((e) => e.path ?? '').toList() as T;
          } else {
            return files.files.first.path as T;
          }
        }
      } on PlatformException catch (e) {
        debugPrint('Unsupported operation $e');
      } catch (ex) {
        debugPrint('$ex');
      }
    }
    return null;
  }

  Future<T?> pickMedia<T>({
    List<String>? extensions,
    String? initialDirectory,
    bool isImage = false,
    bool allowMultiple = false,
    bool allowCompression = true,
  }) async {
    if (UniversalPlatform.isIOS || UniversalPlatform.isAndroid) {
      try {
        final files = await f_picker.FilePicker.platform.pickFiles(
          allowMultiple: allowMultiple,
          allowedExtensions: isImage ? [] : extensions,
          initialDirectory: initialDirectory,
          allowCompression: allowCompression,
          type: f_picker.FileType.media,
        );

        if (files != null) {
          if (allowMultiple) {
            return files.files.map((e) => e.path).toList() as T;
          } else {
            return files.files.first.path as T;
          }
        }
      } on PlatformException catch (e) {
        debugPrint('Unsupported operation $e');
      } catch (ex) {
        debugPrint('$ex');
      }
    }
    return null;
  }

  Future<String?> pickVideo() async {
    // return DeviceMediaServiceImpl().openPickVideo();
    if (UniversalPlatform.isIOS || UniversalPlatform.isAndroid) {
      try {
        final files = await f_picker.FilePicker.platform.pickFiles(
          allowMultiple: false,
          allowCompression: false,
          type: f_picker.FileType.video,
        );

        return files?.files.first.path;
      } on PlatformException catch (e) {
        debugPrint('Unsupported operation $e');
      } catch (ex) {
        debugPrint('$ex');
      }
    }
    return null;
  }
}

class FilePicked {
  FilePicked({
    this.path,
    required this.name,
    required this.size,
    this.bytes,
    this.identifier,
  });

  factory FilePicked.fromPlatFormFile(f_picker.PlatformFile file) {
    ///  On web `path` is always `null`,
    ///  You should access `bytes` property instead,
    ///  Read more about it [here](https://github.com/miguelpruivo/flutter_file_picker/wiki/FAQ)
    return FilePicked(
      path: kIsWeb ? null : file.path,
      name: file.name,
      size: file.size,
      bytes: file.bytes,
      identifier: file.identifier,
    );
  }

  factory FilePicked.fromXFile(XFile file) {
    ///  On web `path` is always `null`,
    ///  You should access `bytes` property instead,
    ///  Read more about it [here](https://github.com/miguelpruivo/flutter_file_picker/wiki/FAQ)
    final f = File(file.path);
    return FilePicked(
      path: kIsWeb ? null : file.path,
      name: file.name,
      size: f.lengthSync(),
      bytes: f.readAsBytesSync(),
    );
  }

  /// The absolute path for a cached copy of this file.
  /// It can be used to create a file instance with a
  /// descriptor for the given path.
  /// ```
  /// final File myFile = File(FilePicked.path);
  /// ```
  /// On web this is always `null`. You should access `bytes` property instead.
  /// Read more about it [here](https://github.com/miguelpruivo/flutter_file_picker/wiki/FAQ)
  final String? path;

  /// File name including its extension.
  final String name;

  /// Byte data for this file.
  /// Particurlarly useful if you want to manipulate its data
  /// or easily upload to somewhere else.
  /// [Check here in the FAQ](https://github.com/miguelpruivo/flutter_file_picker/wiki/FAQ) an example on how to use it to upload on web.
  final Uint8List? bytes;

  /// The file size in bytes. Defaults to `0` if the file size could not be
  /// determined.
  final int size;

  /// The platform identifier for the original file, refers to an [Uri](https://developer.android.com/reference/android/net/Uri) on Android and
  /// to a [NSURL](https://developer.apple.com/documentation/foundation/nsurl) on iOS.
  /// Is set to `null` on all other platforms since those are all already
  /// referencing the original file content.
  ///
  /// Note: You can't use this to create a Dart `File` instance since
  /// this is a safe-reference for the original platform files, for
  /// that the [path] property should be used instead.
  final String? identifier;

  /// File extension for this file.
  String? get extension => name.split('.').last;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is FilePicked &&
        (kIsWeb || other.path == path) &&
        other.name == name &&
        other.bytes == bytes &&
        other.identifier == identifier &&
        other.size == size;
  }

  @override
  int get hashCode {
    return kIsWeb
        ? 0
        : path.hashCode ^
            name.hashCode ^
            bytes.hashCode ^
            identifier.hashCode ^
            size.hashCode;
  }

  @override
  String toString() {
    return '''FilePicked(${kIsWeb ? '' : 'path $path'}, name: $name, bytes: $bytes, size: $size)''';
  }
}

enum FileType {
  any,
  media,
  image,
  video,
  audio,
  custom,
}

extension _FileTypeExt on FileType {
  f_picker.FileType get filePickerType {
    switch (this) {
      case FileType.any:
        return f_picker.FileType.any;
      case FileType.media:
        return f_picker.FileType.media;
      case FileType.image:
        return f_picker.FileType.image;
      case FileType.video:
        return f_picker.FileType.video;
      case FileType.audio:
        return f_picker.FileType.audio;
      case FileType.custom:
        return f_picker.FileType.custom;
    }
  }
}

class PickFileHelper {
  Future<List<FilePicked>> pickFiles({
    String? dialogTitle,
    String? initialDirectory,
    FileType type = FileType.any,
    List<String>? allowedExtensions,
    bool allowCompression = true,
    bool allowMultiple = false,
    bool withData = false,
    bool withReadStream = false,
    bool lockParentWindow = false,
  }) async {
    final result = await f_picker.FilePicker.platform.pickFiles(
      dialogTitle: dialogTitle,
      initialDirectory: initialDirectory,
      type: type.filePickerType,
      allowedExtensions: allowedExtensions,
      allowCompression: allowCompression,
      allowMultiple: allowMultiple,
      withData: withData,
      withReadStream: withReadStream,
      lockParentWindow: lockParentWindow,
    );

    return [...?result?.files.map(FilePicked.fromPlatFormFile)];
  }

  Future<FilePicked?> takePicture() async {
    final picker = ImagePicker();
    final result = await picker.pickImage(
      source: ImageSource.camera,
    );

    return result != null ? FilePicked.fromXFile(result) : null;
  }
}
