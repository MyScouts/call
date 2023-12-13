import 'package:app_core/app_core.dart';

abstract class FollowingRepository {
  Future<FollowingInfo> getFollowers({
    required int page,
    int pageSize = 10,
    String? query,
    int? userId,
    bool excludeFriend = true,
  });

  Future<FollowingInfo> getFollowees({
    required int page,
    int pageSize = 10,
    String? query,
    int? userId,
    bool excludeFriend = true,
  });
  
  Future<FollowingInfo> getFriends({
    required int page,
    int pageSize = 10,
    String? query,
    int? userId,
  });
}
