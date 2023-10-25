import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/user.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final String accessToken;
  final String? stringeeToken;
  final User? userInfo;
  LoginResponse({
    required this.accessToken,
    this.stringeeToken,
    this.userInfo,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
