// Copyright 2022 Fighttech.vn, Ltd. All rights reserved.
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/live_detail.dart';

part 'live.freezed.dart';

part 'live.g.dart';

@freezed
class Live with _$Live {
  @JsonSerializable(explicitToJson: true)
  const factory Live({
    List<LiveDetail>? lives,
    int? total,
  }) = _Live;

  factory Live.fromJson(Map<String, dynamic> json) => _$LiveFromJson(json);
}
