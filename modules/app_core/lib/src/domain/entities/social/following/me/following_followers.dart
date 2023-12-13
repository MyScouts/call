
import 'package:freezed_annotation/freezed_annotation.dart';

import 'following_follower.dart';

part 'following_followers.freezed.dart';

part 'following_followers.g.dart';
@freezed
class FollowingFollowers with _$FollowingFollowers {
  const factory FollowingFollowers({
    int? total,
    List<FollowingFollower>? followers,
  }) = _FollowingFollowers;

  factory FollowingFollowers.fromJson(Map<String, dynamic> json) => _$FollowingFollowersFromJson(json);
}
