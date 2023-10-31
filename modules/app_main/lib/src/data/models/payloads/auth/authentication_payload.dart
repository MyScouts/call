import 'package:json_annotation/json_annotation.dart';
part 'authentication_payload.g.dart';

@JsonSerializable()
class AuthenticationPayload {
  final String username;
  final String password;
  final int countryId;

  const AuthenticationPayload({
    required this.username,
    required this.password,
    required this.countryId,
  });
}

@JsonSerializable()
class ForgotPasswordPayload {
  final String phoneNumber;
  final String phoneCode;

  const ForgotPasswordPayload({
    required this.phoneNumber,
    required this.phoneCode,
  });

  factory ForgotPasswordPayload.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordPayloadFromJson(json);
  Map<String, dynamic> toJson() => _$ForgotPasswordPayloadToJson(this);
}

@JsonSerializable()
class ResetPasswordTokenPayload {
  final String phoneNumber;
  final String phoneCode;
  final String otp;

  const ResetPasswordTokenPayload({
    required this.phoneNumber,
    required this.phoneCode,
    required this.otp,
  });

  Map<String, dynamic> toJson() => _$ResetPasswordTokenPayloadToJson(this);
}

@JsonSerializable()
class ResetPasswordPayload {
  final String password;
  final String ott;

  const ResetPasswordPayload({
    required this.password,
    required this.ott,
  });

  Map<String, dynamic> toJson() => _$ResetPasswordPayloadToJson(this);
}
