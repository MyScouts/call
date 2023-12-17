import 'package:freezed_annotation/freezed_annotation.dart';

part 'following_relation.freezed.dart';

part 'following_relation.g.dart';

@freezed
class FollowingRelation with _$FollowingRelation {
  const factory FollowingRelation({
   @Default(false) bool isFriend,
   @Default(false) bool isFollower,
   @Default(false) bool isFollowee,
   @Default(false) bool hasPendingApproval,
   @Default(false) bool isBlocked,
   @Default(false) bool isBlocking,
  }) = _FollowingRelation;

  factory FollowingRelation.fromJson(Map<String, dynamic> json) =>
      _$FollowingRelationFromJson(json);
}
