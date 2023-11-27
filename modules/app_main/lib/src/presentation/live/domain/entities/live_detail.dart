// Copyright 2022 Fighttech.vn, Ltd. All rights reserved.
// ignore_for_file: invalid_annotation_target

import 'package:app_core/app_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'live_category_detail.dart';
import 'live_media.dart';
import 'virtual_info.dart';

part 'live_detail.freezed.dart';
part 'live_detail.g.dart';

@freezed
class LiveDetail with _$LiveDetail {
  @JsonSerializable(explicitToJson: true)
  const factory LiveDetail(
      {int? id,
      int? userId,
      String? createdAt,
      String? type,
      String? title,
      String? agoraChannel,
      String? agoraToken,
      User? user,
      List<LiveMedia>? medias,
      List<LiveCategoryDetail>? categories,
      VirtualInfo? virtualInfo}) = _LiveDetail;

  factory LiveDetail.fromJson(Map<String, dynamic> json) =>
      _$LiveDetailFromJson(json);
}
