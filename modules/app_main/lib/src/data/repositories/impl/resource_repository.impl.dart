import 'dart:io';

import 'package:injectable/injectable.dart';

import '../../../domain/entities/media/media_model.dart';
import '../../../domain/repository/resource_responsitory.dart';
import '../../data_sources/remote/resource_api.dart';


@Injectable(as: ResourceRepository)
class ResourceRepositoryImpl extends ResourceRepository {
  final ResourceApi _resourceApi;

  ResourceRepositoryImpl(
    this._resourceApi,
  );

  @override
  Future<String> uploadImage(File file) async {
    final result = await _resourceApi.uploadImage(file);

    return result.data['filename'];
  }

  @override
  Future<String> uploadVideo(File file) async {
    final result = await _resourceApi.uploadVideo(file);

    return result.data['filename'];
  }

  @override
  Future<String> uploadFile(File file) async {
    final result = await _resourceApi.uploadFile(file);

    return result.data['filename'];
  }

  // @override
  // Future<List<MediaModel>> getMedias(
  //   String role,
  //   String type,
  //   String category,
  // ) async {
  //   final result = await _resourceApi.getMedias(
  //     role: role,
  //     type: type,
  //     category: category,
  //   );
  //
  //   return result.data;
  // }
}
