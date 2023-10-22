
import 'package:json_annotation/json_annotation.dart';

part 'authentication_phone_payload.g.dart';

@JsonSerializable()
class AuthenticationPhonePayload {
  final String phone;

  final String password;

  @JsonKey(name: 'country_id')
  final int countryId;

  const AuthenticationPhonePayload({
    required this.phone,
    required this.password,
    required this.countryId,
  });

  factory AuthenticationPhonePayload.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationPhonePayloadFromJson(json);
}
