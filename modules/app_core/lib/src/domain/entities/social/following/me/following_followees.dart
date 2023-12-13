
import 'package:freezed_annotation/freezed_annotation.dart';

import 'following_followee.dart';
part 'following_followees.freezed.dart';

part 'following_followees.g.dart';
@freezed
class FollowingFollowees with _$FollowingFollowees {
  const factory FollowingFollowees({
    int? total,
    List<FollowingFollowee>? followees,
  }) = _FollowingFollowees;

  factory FollowingFollowees.fromJson(Map<String, dynamic> json) => _$FollowingFolloweesFromJson(json);
}
