import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/data_sources/remote/following_api.dart';
import 'package:injectable/injectable.dart';

import '../following_repository.dart';

@Injectable(as: FollowingRepository)
class FollowingRepositoryImpl extends FollowingRepository {
  final FollowingAPI _followingAPI;

  FollowingRepositoryImpl(this._followingAPI);

  @override
  Future<FollowingInfo> getFollowers({
    required int page,
    int pageSize = 10,
    String? query,
    int? userId,
    bool excludeFriend = true,
  }) async {
    late FollowingInfo followingInfo;
    if (userId == null) {
      final response = await _followingAPI.getFollowers(
          page, pageSize, query, excludeFriend);

      List<FollowingRelationUser> info = [];
      if (response.followers != null) {
        for (var element in response.followers!) {
          FollowingRelation relation =
              const FollowingRelation(isFollowee: true);

          if (element.isFriend != null && element.isFriend!) {
            relation = relation.copyWith(
              isFriend: true,
              isFollowee: false,
            );
          }

          if (element.hasPendingApproval != null &&
              element.hasPendingApproval!) {
            relation = relation.copyWith(
              isFriend: false,
              isFollowee: false,
              hasPendingApproval: true,
            );
          }
          info.add(FollowingRelationUser(
              user: element.follower, relation: relation));
        }
      }

      followingInfo = FollowingInfo(
        total: response.total,
        info: info,
      );
    } else {
      final response = await _followingAPI.getUserFollowers(
          userId, page, pageSize, query, excludeFriend);
      followingInfo = FollowingInfo(
        total: response.total,
        info: response.followers,
      );
    }
    return followingInfo;
  }

  @override
  Future<FollowingInfo> getFollowees({
    required int page,
    int pageSize = 10,
    String? query,
    int? userId,
    bool excludeFriend = true,
  }) async {
    late FollowingInfo followingInfo;
    if (userId == null) {
      final response = await _followingAPI.getFollowees(
          page, pageSize, query, excludeFriend);

      List<FollowingRelationUser> info = [];
      if (response.followees != null) {
        for (var element in response.followees!) {
          FollowingRelation relation =
              const FollowingRelation(isFollower: true);
          relation = relation.copyWith();

          if (element.isFriend != null && element.isFriend!) {
            relation = relation.copyWith(
              isFriend: true,
              isFollower: false,
            );
          }
          info.add(FollowingRelationUser(
              user: element.followee, relation: relation));
        }
      }

      followingInfo = FollowingInfo(
        total: response.total,
        info: info,
      );
    } else {
      final response = await _followingAPI.getUserFollowees(
          userId, page, pageSize, query, excludeFriend);
      followingInfo = FollowingInfo(
        total: response.total,
        info: response.followees,
      );
    }
    return followingInfo;
  }

  @override
  Future<FollowingInfo> getFriends({
    required int page,
    int pageSize = 10,
    String? query,
    int? userId,
  }) async {
    late FollowingInfo followingInfo;
    if (userId == null) {
      final response = await _followingAPI.getFriends(page, pageSize, query);

      List<FollowingRelationUser> info = [];
      if (response.friends != null) {
        for (var element in response.friends!) {
          FollowingRelation relation = const FollowingRelation(
            isFriend: true,
            isFollowee: true,
            isFollower: true,
          );

          info.add(FollowingRelationUser(user: element, relation: relation));
        }
      }

      followingInfo = FollowingInfo(
        total: response.total,
        info: info,
      );
    } else {
      final response =
          await _followingAPI.getUserFriends(userId, page, pageSize, query);
      followingInfo = FollowingInfo(
        total: response.total,
        info: response.friends,
      );
    }

    return followingInfo;
  }
}
