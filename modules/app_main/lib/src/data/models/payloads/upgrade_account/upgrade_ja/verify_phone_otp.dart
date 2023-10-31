import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_phone_otp.freezed.dart';
part 'verify_phone_otp.g.dart';

@freezed
class VerifyPhoneOtpPayload with _$VerifyPhoneOtpPayload {
  const factory VerifyPhoneOtpPayload({
    required String token,
    required String otp,
    String? teamId,
  }) = _VerifyPhoneOtpPayload;

  factory VerifyPhoneOtpPayload.fromJson(Map<String, dynamic> json) =>
      _$VerifyPhoneOtpPayloadFromJson(json);
}
