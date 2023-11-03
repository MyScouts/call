import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_phone_otp.g.dart';

@JsonSerializable()
class VerifyPhoneOtpPayload {
  final String token;
  final String otp;

  VerifyPhoneOtpPayload({
    required this.token,
    required this.otp,
  });

  factory VerifyPhoneOtpPayload.fromJson(Map<String, dynamic> json) =>
      _$VerifyPhoneOtpPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyPhoneOtpPayloadToJson(this);
}
