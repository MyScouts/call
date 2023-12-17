
import 'package:freezed_annotation/freezed_annotation.dart';

import '../following_relation_user.dart';

part 'following_user_followers.freezed.dart';

part 'following_user_followers.g.dart';
@freezed
class FollowingUserFollowers with _$FollowingUserFollowers {
  const factory FollowingUserFollowers({
    int? total,
    List<FollowingRelationUser>? followers,
  }) = _FollowingUserFollowers;

  factory FollowingUserFollowers.fromJson(Map<String, dynamic> json) => _$FollowingUserFollowersFromJson(json);
}
