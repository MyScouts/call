// Copyright 2022 Fighttech.vn, Ltd. All rights reserved.
import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_otp_with_email_payload.freezed.dart';
part 'verify_otp_with_email_payload.g.dart';

@freezed
class VerifyOtpWithEmailPayload with _$VerifyOtpWithEmailPayload {
  const factory VerifyOtpWithEmailPayload({
    required String email,
    required String otp,
    required String token,
  }) = _VerifyOtpWithEmailPayload;

  factory VerifyOtpWithEmailPayload.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpWithEmailPayloadFromJson(json);
}
