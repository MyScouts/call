import 'dart:io';
import 'dart:typed_data';

import 'package:app_main/src/data/models/payloads/resource/resource_payload.dart';
import 'package:app_main/src/data/models/responses/resource_response.dart';
import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/networking/api_response.dart';
import '../../../domain/entities/media/media_model.dart';
import '../../models/responses/storage_upload_url_response.dart';

part 'resource_api.g.dart';

class ResourceApiConstant {
  static const String getUserMedia =
      'api/medias/{role}?category={category}&type={type}';
  static const String latestVersion = 'api/v1/app-version/type/{type}/latest';
  static const String globalSetting = 'api/v1/setting/{key}';
  static const String userConfig = "api/v1/setting/personal/user/{userId}";
  static const String renderPDF = "api/v1/render-pdf";
}

@RestApi()
@injectable
abstract class ResourceApi {
  @factoryMethod
  factory ResourceApi(Dio dio) = _ResourceApi;

  @GET(ResourceApiConstant.getUserMedia)
  Future<ApiResponse<List<MediaModel>>> getMedias({
    @Path('role') required String role,
    @Path('type') required String type,
    @Path('category') required String category,
  });

  Future<String> storageUploadUrl(XFile file, String prefix);

  @GET(ResourceApiConstant.latestVersion)
  Future<LatestVersionResponse> latestVersion({
    @Path('type') required String type,
  });

  @GET(ResourceApiConstant.globalSetting)
  Future<GlobalSettingResponse> getGlobalSetting(@Path('key') String key);

  @GET(ResourceApiConstant.userConfig)
  Future<GlobalPersonResponse> getGlobalPeronSetting(
    @Path('userId') int userId,
  );

  @POST(ResourceApiConstant.renderPDF)
  Future<RenderPDFResponse> renderPDF(@Body() dynamic payload);
}
