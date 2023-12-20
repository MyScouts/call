import 'package:app_main/src/data/models/payloads/resource/resource_payload.dart';
import 'package:app_main/src/data/models/responses/resource_response.dart';
import 'package:image_picker/image_picker.dart';

abstract class ResourceRepository {
  Future<VersionResponse?> latestVersion({required String type});
  Future<GlobalSettingResponse> getGlobalConfig({required String key});
  Future<GlobalPersonResponse> getGlobalPersonSetting({required int userId});
  Future<String> storageUploadUrl(XFile xFile, String prefix);
  Future<RenderPDFResponse> renderPDF(RenderPDFPayload payload);
}
