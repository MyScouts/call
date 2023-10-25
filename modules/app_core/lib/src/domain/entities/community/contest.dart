// Copyright 2022 Fighttech.vn, Ltd. All rights reserved.
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'contest.freezed.dart';
part 'contest.g.dart';

@freezed
class Contest with _$Contest {
  const factory Contest({
    int? id,
    int? contestId,
    String? name,
    String? status,
  }) = _Contest;

  factory Contest.fromJson(Map<String, dynamic> json) =>
      _$ContestFromJson(json);
}
