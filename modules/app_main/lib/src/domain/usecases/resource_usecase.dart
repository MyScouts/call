import 'dart:io';

import 'package:app_main/src/data/models/responses/resource_response.dart';
import 'package:injectable/injectable.dart';

import '../repository/resource_repository.dart';

@injectable
class ResourceUsecase {
  final ResourceRepository _resourceRepository;

  ResourceUsecase(this._resourceRepository);

  Future<String> uploadImage(File image) {
    return _resourceRepository.uploadImage(image);
  }

  Future<String> uploadVideo(File video) {
    return _resourceRepository.uploadVideo(video);
  }

  Future<String> uploadFile(File file) {
    return _resourceRepository.uploadFile(file);
  }

  Future<VersionResponse?> getLatestVersion({required String type}) async {
    final response = await _resourceRepository.latestVersion(type: type);
    return response;
  }

  Future<GlobalSettingResponse> getGlobalConfig({required String key}) async {
    return _resourceRepository.getGlobalConfig(key: key);
  }

  Future<Map<String, dynamic>> getGlobalPerson(int userId) async {
    final response =
        await _resourceRepository.getGlobalPersonSetting(userId: userId);
    return response.setting;
  }
}
