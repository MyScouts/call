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
