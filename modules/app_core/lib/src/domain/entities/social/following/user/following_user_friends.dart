
import 'package:freezed_annotation/freezed_annotation.dart';

import '../following_relation_user.dart';

part 'following_user_friends.freezed.dart';

part 'following_user_friends.g.dart';
@freezed
class FollowingUserFriends with _$FollowingUserFriends {
  const factory FollowingUserFriends({
    int? total,
    List<FollowingRelationUser>? friends,
  }) = _FollowingUserFriends;

  factory FollowingUserFriends.fromJson(Map<String, dynamic> json) => _$FollowingUserFriendsFromJson(json);
}
