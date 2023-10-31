// Copyright 2022 Fighttech.vn, Ltd. All rights reserved.
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_fan_group_info.freezed.dart';
part 'user_fan_group_info.g.dart';

@freezed
class UserFanGroupInfo with _$UserFanGroupInfo {
  const factory UserFanGroupInfo({
    int? status,
    int? fanGroupId,
    List<int>? types,
  }) = _UserFanGroupInfo;

  factory UserFanGroupInfo.fromJson(Map<String, dynamic> json) =>
      _$UserFanGroupInfoFromJson(json);
}
