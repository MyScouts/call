// Copyright 2022 Fighttech.vn, Ltd. All rights reserved.
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../user/user.dart';
import 'contest.dart';

part 'fan_group.freezed.dart';
part 'fan_group.g.dart';

@freezed
class FanGroup with _$FanGroup {
  const factory FanGroup({
    int? id,
    String? name,
    String? avatar,
    String? banner,
    String? introduction,
    User? boss,
    List<Contest>? contests,
    int? totalBossGroup,
    int? totalBossTeam,
    int? totalMember,
  }) = _FanGroup;

  factory FanGroup.fromJson(Map<String, dynamic> json) =>
      _$FanGroupFromJson(json);
}

extension FanGroupExt on FanGroup {
  String get currentProccess {
    if (contests == null || contests!.isEmpty) {
      return '';
    }
    final idx = contests!.indexWhere((e) => e.status == 'PROCESSING');
    if (idx == -1) {
      return '';
    }
    return 'Vòng ${contests![idx].name}';
  }
}
