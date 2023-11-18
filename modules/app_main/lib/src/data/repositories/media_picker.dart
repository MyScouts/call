import 'package:app_main/src/domain/entities/media/media_file.dart';

abstract class MediaPicker {
  Future<List<MediaFile?>?> pickImagesFromGallery();

  Future<MediaFile?> pickImageFromCamera();
}