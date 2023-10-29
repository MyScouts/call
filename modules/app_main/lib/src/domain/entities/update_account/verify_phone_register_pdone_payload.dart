// Copyright 2022 Fighttech.vn, Ltd. All rights reserved.
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_phone_register_pdone_payload.freezed.dart';
part 'verify_phone_register_pdone_payload.g.dart';

@freezed
class VerifyOtpPDonePayload with _$VerifyOtpPDonePayload {
  const factory VerifyOtpPDonePayload({
    @JsonKey(includeIfNull: false) String? token,
    @JsonKey(includeIfNull: false) String? phone,
    @JsonKey(includeIfNull: false) String? phoneCode,
    @JsonKey(includeIfNull: false) String? email,
    required String otp,
  }) = _VerifyOtpPDonePayload;

  factory VerifyOtpPDonePayload.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpPDonePayloadFromJson(json);
}
