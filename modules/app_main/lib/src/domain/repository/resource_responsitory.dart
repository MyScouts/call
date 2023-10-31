import 'dart:io';


abstract class ResourceRepository {
  Future<String> uploadImage(File file);
  Future<String> uploadVideo(File file);
  Future<String> uploadFile(File file);
  // Future<List<MediaModel>> getMedias(
  //   String role,
  //   String type,
  //   String category,
  // );
}
