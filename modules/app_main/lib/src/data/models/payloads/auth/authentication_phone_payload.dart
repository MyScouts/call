import 'package:json_annotation/json_annotation.dart';

part 'authentication_phone_payload.g.dart';

@JsonSerializable()
class AuthenticationPhonePayload {
  final String phoneCode;
  final String phoneNumber;
  final String password;

  const AuthenticationPhonePayload({
    required this.phoneNumber,
    required this.password,
    required this.phoneCode,
  });

  factory AuthenticationPhonePayload.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationPhonePayloadFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticationPhonePayloadToJson(this);
}

@JsonSerializable()
class CompletedPhoneRegisterPayload {
  final String phoneCode;
  final String phoneNumber;
  final String otp;

  const CompletedPhoneRegisterPayload({
    required this.phoneNumber,
    required this.otp,
    required this.phoneCode,
  });

  factory CompletedPhoneRegisterPayload.fromJson(Map<String, dynamic> json) =>
      _$CompletedPhoneRegisterPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$CompletedPhoneRegisterPayloadToJson(this);
}
