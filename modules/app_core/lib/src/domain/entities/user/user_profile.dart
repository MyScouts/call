// Copyright 2022 Fighttech.vn, Ltd. All rights reserved.
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
class UserProfileInfo with _$UserProfileInfo {
  const factory UserProfileInfo({
    DateTime? birthday,
  }) = _UserProfileInfo;

  factory UserProfileInfo.fromJson(Map<String, dynamic> json) =>
      _$UserProfileInfoFromJson(json);
}
