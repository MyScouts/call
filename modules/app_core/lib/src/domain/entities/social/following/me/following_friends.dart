
import 'package:freezed_annotation/freezed_annotation.dart';

import '../following_user.dart';

part 'following_friends.freezed.dart';

part 'following_friends.g.dart';
@freezed
class FollowingFriends with _$FollowingFriends {
  const factory FollowingFriends({
    int? total,
    List<FollowingUser>? friends,
  }) = _FollowingFriends;

  factory FollowingFriends.fromJson(Map<String, dynamic> json) => _$FollowingFriendsFromJson(json);
}
