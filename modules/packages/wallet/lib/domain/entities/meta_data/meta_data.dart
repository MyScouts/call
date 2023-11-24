// Copyright 2022 Fighttech.vn, Ltd. All rights reserved.
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'meta_data.freezed.dart';

part 'meta_data.g.dart';

@freezed
class MetaData with _$MetaData {
  const factory MetaData({
    int? protectorOf,
    String? pDoneId,
    int? hourCount,
    int? fromUserId,
    String? role,
  }) = _MetaData;

  factory MetaData.fromJson(Map<String, dynamic> json) =>
      _$MetaDataFromJson(json);
}
