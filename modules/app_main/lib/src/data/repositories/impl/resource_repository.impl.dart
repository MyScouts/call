import 'package:app_main/src/data/models/payloads/resource/resource_payload.dart';
import 'package:app_main/src/data/models/responses/resource_response.dart';
import 'package:app_main/src/domain/repository/resource_repository.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import '../../data_sources/remote/resource_api.dart';

@Injectable(as: ResourceRepository)
class ResourceRepositoryImpl extends ResourceRepository {
  final ResourceApi _resourceApi;

  ResourceRepositoryImpl(
    this._resourceApi,
  );

  @override
  Future<VersionResponse?> latestVersion({required String type}) async {
    final response = await _resourceApi.latestVersion(type: type);
    return response.appVersion;
  }

  @override
  Future<GlobalSettingResponse> getGlobalConfig({required String key}) {
    return _resourceApi.getGlobalSetting(key);
  }

  @override
  Future<GlobalPersonResponse> getGlobalPersonSetting({required int userId}) {
    return _resourceApi.getGlobalPeronSetting(userId);
  }

  @override
  Future<String> storageUploadUrl(XFile xFile, String prefix) async {
    final res = await _resourceApi.storageUploadUrl(xFile, prefix);
    return res;
  }

  @override
  Future<RenderPDFResponse> renderPDF(RenderPDFPayload payload) {
    return _resourceApi.renderPDF(payload.toJson());
  }
}
