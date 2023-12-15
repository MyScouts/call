import 'dart:io';

import 'package:app_main/src/data/repositories/media_picker.dart';
import 'package:app_main/src/domain/entities/media/media_file.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:video_player/video_player.dart';

@LazySingleton(as: MediaPicker)
class MediaPickerImpl implements MediaPicker {
  @override
  Future<List<MediaFile?>?> pickImagesFromGallery({
    bool allowMultiple = true,
  }) async {
    try {
      final FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowCompression: true,
        allowMultiple: allowMultiple,
        lockParentWindow: true,
        withData: true,
      );

      if (result == null || result.files.isEmpty) return null;

      final files = result.files;

      if (files.isEmpty || files.first.path == null) return null;

      final List<MediaFile> pickedImages = <MediaFile>[];

      for (final file in files) {
        if (file.path != null || file.bytes != null) {
          final image = await decodeImageFromList(file.bytes!);

          final mediaFile = MediaFile(
            path: file.path!,
            extension: file.extension,
            size: file.size,
            width: image.width,
            height: image.height,
          );

          pickedImages.add(mediaFile);
        }
      }

      return pickedImages;
    } catch (error) {
      return null;
    }
  }

  @override
  Future<MediaFile?> pickImageFromCamera() async {
    try {
      final xFile = await ImagePicker().pickImage(
        source: ImageSource.camera,
        maxHeight: 1000,
        maxWidth: 1000,
        preferredCameraDevice: CameraDevice.rear,
      );

      if (xFile == null) return null;

      final futures = [
        xFile.length(),
        decodeImageFromList(await xFile.readAsBytes()),
      ];

      final result = await Future.wait(futures);
      final size = result[0] as int;
      final image = result[1] as Image;

      return MediaFile(
        path: xFile.path,
        extension: xFile.mimeType,
        size: size,
        width: image.width ?? 0.0,
        height: image.height ?? 0.0,
      );
    } catch (error) {
      if (error is PlatformException) rethrow;
      return null;
    }
  }

  @override
  Future<MediaFile?> pickVideoFromGallery() async {
    try {
      final xFile = await ImagePicker().pickVideo(
        source: ImageSource.gallery,
      );

      if (xFile == null) return null;

      final file = File(xFile.path);

      VideoPlayerController controller = VideoPlayerController.file(file);
      await controller.initialize();

      return MediaFile(
        path: xFile.path,
        size: file.lengthSync(),
        videoDuration: controller.value.duration,
      );
    } catch (error) {
      if (error is PlatformException) rethrow;
      return null;
    }
  }
}
