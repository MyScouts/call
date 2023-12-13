
import 'package:freezed_annotation/freezed_annotation.dart';

import '../following_relation_user.dart';

part 'following_user_followees.freezed.dart';

part 'following_user_followees.g.dart';
@freezed
class FollowingUserFollowees with _$FollowingUserFollowees {
  const factory FollowingUserFollowees({
    int? total,
    List<FollowingRelationUser>? followees,
  }) = _FollowingUserFollowees;

  factory FollowingUserFollowees.fromJson(Map<String, dynamic> json) => _$FollowingUserFolloweesFromJson(json);
}
