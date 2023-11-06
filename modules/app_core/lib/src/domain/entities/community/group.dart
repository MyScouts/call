// Copyright 2022 Fighttech.vn, Ltd. All rights reserved.
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../user/user.dart';

part 'group.freezed.dart';
part 'group.g.dart';

@freezed
class Group with _$Group {
  const factory Group({
    String? id,
    String? name,
    bool? isProvincialGroup,
    String? avatar,
    String? banner,
    String? introduction,
    int? teamCount,
    int? openTeamCount,
    User? boss,
  }) = _Group;

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
}
