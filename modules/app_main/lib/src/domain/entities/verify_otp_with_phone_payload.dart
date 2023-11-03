// Copyright 2022 Fighttech.vn, Ltd. All rights reserved.
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_otp_with_phone_payload.freezed.dart';
part 'verify_otp_with_phone_payload.g.dart';

@freezed
class VerifyOtpWithPhonePayload with _$VerifyOtpWithPhonePayload {
  const factory VerifyOtpWithPhonePayload({
    required String token,
    required String phone,
    @JsonKey(name: 'country_id', includeIfNull: false) required int countryId,
    @JsonKey(includeIfNull: false) String? phoneCode,
    @JsonKey(includeIfNull: false) String? otp,
  }) = _VerifyOtpWithPhonePayload;

  factory VerifyOtpWithPhonePayload.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpWithPhonePayloadFromJson(json);
}
