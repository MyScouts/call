// Copyright 2022 Fighttech.vn, Ltd. All rights reserved.
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'group.dart';
import 'team.dart';

part 'community.freezed.dart';

@freezed
class Community with _$Community {
  const factory Community({
    String? id,
    String? groupId,
    String? name,
    String? avatar,
    String? banner,
    String? introduction,
    int? status,
  }) = _Community;

  factory Community.copyWithGroup(Group group) {
    return Community(
      id: group.id,
      name: group.name,
      avatar: group.avatar,
      banner: group.banner,
      introduction: group.introduction,
    );
  }

  factory Community.copyWithTeam(Team team) {
    return Community(
      id: team.id,
      name: team.name,
      avatar: team.avatar,
      banner: team.banner,
      introduction: team.introduction,
    );
  }
}
