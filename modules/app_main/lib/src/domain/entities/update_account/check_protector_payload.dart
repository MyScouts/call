// Copyright 2022 Fighttech.vn, Ltd. All rights reserved.
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_protector_payload.freezed.dart';
part 'check_protector_payload.g.dart';

@freezed
class CheckProtectorPayload with _$CheckProtectorPayload {
  const factory CheckProtectorPayload({
    String? protectorEmailPhone,
    String? protectorIdentityNumber,
    String? protectorPDoneId,
  }) = _CheckProtectorPayload;

  factory CheckProtectorPayload.fromJson(Map<String, dynamic> json) =>
      _$CheckProtectorPayloadFromJson(json);
}
