import 'package:json_annotation/json_annotation.dart';

part 'register_with_phone_response.g.dart';

@JsonSerializable()
class RegisterWithPhoneResponse {
  final String token;
  final String phone;
  final String? otpExpiresTime;
  final String? phoneCode;

  const RegisterWithPhoneResponse({
    required this.token,
    required this.phone,
    this.otpExpiresTime,
    this.phoneCode,
  });

  factory RegisterWithPhoneResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterWithPhoneResponseFromJson(json);
}
