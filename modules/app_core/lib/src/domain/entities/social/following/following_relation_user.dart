import 'package:freezed_annotation/freezed_annotation.dart';

import 'following_relation.dart';
import 'following_user.dart';

part 'following_relation_user.freezed.dart';

part 'following_relation_user.g.dart';

@freezed
class FollowingRelationUser with _$FollowingRelationUser {
  const factory FollowingRelationUser({
    FollowingUser? user,
    FollowingRelation? relation,
  }) = _FollowingRelationUser;

  factory FollowingRelationUser.fromJson(Map<String, dynamic> json) =>
      _$FollowingRelationUserFromJson(json);
}
