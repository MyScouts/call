import 'package:app_core/app_core.dart';

class UserVerifyResponse {
  final User user;

  UserVerifyResponse(this.user);
  
  factory UserVerifyResponse.fromJson(Map<String, dynamic> json) {
    return UserVerifyResponse(User.fromJson(json['user']));
  }
}