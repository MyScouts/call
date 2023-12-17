
import 'package:freezed_annotation/freezed_annotation.dart';

import '../following_user.dart';

part 'following_followee.freezed.dart';

part 'following_followee.g.dart';
@freezed
class FollowingFollowee with _$FollowingFollowee {
  const factory FollowingFollowee({
    bool? isFriend,
    FollowingUser? followee,
  }) = _FollowingFollowee;

  factory FollowingFollowee.fromJson(Map<String, dynamic> json) => _$FollowingFolloweeFromJson(json);
}
