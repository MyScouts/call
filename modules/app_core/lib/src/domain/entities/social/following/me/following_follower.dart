
import 'package:freezed_annotation/freezed_annotation.dart';

import '../following_user.dart';

part 'following_follower.freezed.dart';

part 'following_follower.g.dart';
@freezed
class FollowingFollower with _$FollowingFollower {
  const factory FollowingFollower({
    bool? isFriend,
    bool? hasPendingApproval,
    FollowingUser? follower,
  }) = _FollowingFollower;

  factory FollowingFollower.fromJson(Map<String, dynamic> json) => _$FollowingFollowerFromJson(json);
}
