import 'package:app_core/app_core.dart';
import 'package:injectable/injectable.dart';

import '../../data/repositories/following_repository.dart';

@injectable
class FollowingUsecase {
  final FollowingRepository _followingRepository;

  FollowingUsecase(
    this._followingRepository,
  );

  Future<FollowingInfo> getFollowers({
    required int page,
    int pageSize = 10,
    String? query,
    int? userId,
  }) async {
    return _followingRepository.getFollowers(
      page: page,
      pageSize: pageSize,
      query: query,
      userId: userId,
    );
  }

  Future<FollowingInfo> getFollowees({
    required int page,
    int pageSize = 10,
    String? query,
    int? userId,
  }) async {
    return _followingRepository.getFollowees(
      page: page,
      pageSize: pageSize,
      query: query,
      userId: userId,
    );
  }

  Future<FollowingInfo> getFriends({
    required int page,
    int pageSize = 10,
    String? query,
    int? userId,
  }) async {
    return _followingRepository.getFriends(
      page: page,
      pageSize: pageSize,
      query: query,
      userId: userId,
    );
  }
}
