import 'dart:io';

import 'package:injectable/injectable.dart';

import '../repository/resource_responsitory.dart';

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
  //
  // Future<List<MediaModel>> getBanners({
  //   required GetResourceMediaParam param,
  // }) {
  //   return _resourceRepository.getMedias(
  //     param.role.name,
  //     param.resourceMedia.type.name,
  //     param.resourceMedia.category,
  //   );
  // }
}
