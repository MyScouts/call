import 'dart:io';

import 'package:app_main/src/data/models/responses/resource_response.dart';

abstract class ResourceRepository {
  Future<String> uploadImage(File file);
  Future<String> uploadVideo(File file);
  Future<String> uploadFile(File file);
  Future<VersionResponse?> latestVersion({required String type});
  Future<GlobalSettingResponse> getGlobalConfig({required String key});
  Future<GlobalPersonResponse> getGlobalPersonSetting({required int userId});
}
