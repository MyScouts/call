// Copyright 2022 Fighttech.vn, Ltd. All rights reserved.
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    int? id,
    String? avatar,
    bool? isPDone,
    String? firstName,
    String? middleName,
    String? lastName,
    String? pDoneId,
    String? coinAmount,
    String? coinVndAmount,
    String? diamondAmount,
    String? displayName,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
