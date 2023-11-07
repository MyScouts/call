import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password_payload.g.dart';

@JsonSerializable()
class ChangePasswordPayload {
  final String currentPassword;
  final String newPassword;
  final String confirmPassword;

  ChangePasswordPayload({
    required this.currentPassword,
    required this.newPassword,
    required this.confirmPassword,
  });

  factory ChangePasswordPayload.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordPayloadToJson(this);
}
