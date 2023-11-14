import 'dart:io';
import 'dart:typed_data';

import 'package:app_main/src/data/models/payloads/upgrade_account/upgrade_pdone/pdone_request_protector_req.dart';
import 'package:app_main/src/data/models/responses/storage_upload_url_response.dart';
import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/networking/api_response.dart';
import '../../../domain/entities/media/media_model.dart';

part 'resource_api.g.dart';

class ResourceApiConstant {
  static const String uploadImage = 'api/upload/image';
  static const String uploadVideo = 'api/upload/video';
  static const String uploadFile = 'api/upload/file';
  static const String getUserMedia =
      'api/medias/{role}?category={category}&type={type}';
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
}
