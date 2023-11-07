// Copyright 2022 Fighttech.vn, Ltd. All rights reserved.
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../user/user.dart';

part 'team.freezed.dart';
part 'team.g.dart';

@freezed
class Team with _$Team {
  const factory Team({
    String? id,
    String? groupId,
    String? name,
    String? avatar,
    String? banner,
    int? status,
    String? introduction,
    User? boss,
    int? memberCount,
  }) = _Team;

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson({
        ...json,
        'id': json['id'] is int ? "${json['id']}" : json['id'],
      });
}
