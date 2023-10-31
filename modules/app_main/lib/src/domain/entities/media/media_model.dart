// Copyright 2022 Fighttech.vn, Ltd. All rights reserved.
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_model.freezed.dart';
part 'media_model.g.dart';

@freezed
class MediaModel with _$MediaModel {
  @JsonSerializable(explicitToJson: true)
  const factory MediaModel({
    int? id,
    String? redirectUrl,
    String? url,
    String? type,
    String? category,
    String? name,
    int? order,
    DateTime? createdAt,
  }) = _MediaModel;

  factory MediaModel.fromJson(Map<String, dynamic> json) =>
      _$MediaModelFromJson(json);
}
