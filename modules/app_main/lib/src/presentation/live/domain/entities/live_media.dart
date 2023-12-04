// Copyright 2022 Fighttech.vn, Ltd. All rights reserved.
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'live_media.freezed.dart';
part 'live_media.g.dart';

@freezed
class LiveMedia with _$LiveMedia {
  @JsonSerializable(explicitToJson: true)
  const factory LiveMedia({
    required int id,
    required String link,
  }) = _LiveMedia;

  factory LiveMedia.fromJson(Map<String, dynamic> json) =>
      _$LiveMediaFromJson(json);
}
