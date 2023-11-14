import 'dart:io';

import 'package:app_main/src/data/models/responses/resource_response.dart';

abstract class ResourceRepository {
  Future<String> uploadImage(File file);
  Future<String> uploadVideo(File file);
  Future<String> uploadFile(File file);
  Future<VersionResponse?> latestVersion();
  // Future<List<MediaModel>> getMedias(
  //   String role,
  //   String type,
  //   String category,
  // );
}
