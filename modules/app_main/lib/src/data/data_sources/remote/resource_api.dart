import 'dart:io';
import 'dart:typed_data';

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
  static const String uploadImage = 'api/upload/image';
  static const String uploadVideo = 'api/upload/video';
  static const String uploadFile = 'api/upload/file';
  static const String getUserMedia =
      'api/medias/{role}?category={category}&type={type}';
  static const String latestVersion = 'api/v1/app-version/type/{type}/latest';
  static const String globalSetting = 'api/v1/setting/{key}';
  static const String userConfig = "api/v1/setting/personal/user/{userId}";
}

@RestApi()
@injectable
abstract class ResourceApi {
  @factoryMethod
  factory ResourceApi(Dio dio) = _ResourceApi;

  @POST(ResourceApiConstant.uploadImage)
  @MultiPart()
  Future<ApiResponse<dynamic>> uploadImage(@Part(name: 'file') File file);

  @POST(ResourceApiConstant.uploadVideo)
  @MultiPart()
  Future<ApiResponse<dynamic>> uploadVideo(@Part(name: 'file') File file);

  @POST(ResourceApiConstant.uploadFile)
  @MultiPart()
  Future<ApiResponse<dynamic>> uploadFile(@Part(name: 'file') File file);

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
}
