
import 'package:freezed_annotation/freezed_annotation.dart';

import 'following_relation_user.dart';

part 'following_info.freezed.dart';

part 'following_info.g.dart';
@freezed
class FollowingInfo with _$FollowingInfo {
  const factory FollowingInfo({
    int? total,
    List<FollowingRelationUser>? info,
  }) = _FollowingInfo;

  factory FollowingInfo.fromJson(Map<String, dynamic> json) => _$FollowingInfoFromJson(json);
}
