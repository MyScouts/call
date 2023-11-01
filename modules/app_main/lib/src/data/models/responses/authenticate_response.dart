import 'package:json_annotation/json_annotation.dart';

part 'authenticate_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final String accessToken;
  final String refreshToken;
  LoginResponse({
    required this.accessToken,
    required this.refreshToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@JsonSerializable()
class PhoneCompleteRegister {
  final String accessToken;
  final String refreshToken;
  PhoneCompleteRegister({
    required this.accessToken,
    required this.refreshToken,
  });

  factory PhoneCompleteRegister.fromJson(Map<String, dynamic> json) =>
      _$PhoneCompleteRegisterFromJson(json);
}

@JsonSerializable()
class ResetPasswordTokenResponse {
  final String ott;

  ResetPasswordTokenResponse({
    required this.ott,
  });

  factory ResetPasswordTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordTokenResponseFromJson(json);
}

@JsonSerializable()
class ResetPasswordResponse {
  final String accessToken;
  final String refreshToken;

  ResetPasswordResponse({
    required this.accessToken,
    required this.refreshToken,
  });

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordResponseFromJson(json);
}
