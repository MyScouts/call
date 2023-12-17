import 'package:app_main/src/data/models/payloads/resource/resource_payload.dart';
import 'package:app_main/src/data/models/responses/resource_response.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import '../repository/resource_repository.dart';

@injectable
class ResourceUsecase {
  final ResourceRepository _resourceRepository;

  ResourceUsecase(this._resourceRepository);
  Future<VersionResponse?> getLatestVersion({required String type}) async {
    final response = await _resourceRepository.latestVersion(type: type);
    return response;
  }

  Future<GlobalSettingResponse> getGlobalConfig(String key) async {
    return _resourceRepository.getGlobalConfig(key: key);
  }

  Future<Map<String, dynamic>> getGlobalPerson(int userId) async {
    final response =
        await _resourceRepository.getGlobalPersonSetting(userId: userId);
    return response.setting;
  }

  Future<String> storageUploadUrl(String filePath, String prefix) async {
    final res =
        await _resourceRepository.storageUploadUrl(XFile(filePath), prefix);
    return res;
  }

  Future<String> renderPDF(RenderPDFPayload payload) async {
    final response = await _resourceRepository.renderPDF(payload);
    return response.url;
  }
}
