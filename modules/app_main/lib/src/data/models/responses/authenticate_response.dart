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
