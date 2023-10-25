// Copyright 2022 Fighttech.vn, Ltd. All rights reserved.
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../user/user.dart';

part 'member.freezed.dart';
part 'member.g.dart';

@freezed
class Member with _$Member {
  const factory Member({
    int? id,
    int? userId,
    User? user,
  }) = _Member;

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);
}
