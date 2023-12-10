import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password_payload.g.dart';

@JsonSerializable()
class ChangePasswordPayload {
  final String oldPassword;
  final String newPassword;

  ChangePasswordPayload({
    required this.oldPassword,
    required this.newPassword,
  });

  factory ChangePasswordPayload.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordPayloadToJson(this);
}
