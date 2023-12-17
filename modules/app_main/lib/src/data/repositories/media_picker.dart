import 'package:app_main/src/domain/entities/media/media_file.dart';

abstract class MediaPicker {
  Future<List<MediaFile?>?> pickImagesFromGallery({bool allowMultiple});

  Future<MediaFile?> pickImageFromCamera();

  Future<MediaFile?> pickVideoFromGallery();
}
