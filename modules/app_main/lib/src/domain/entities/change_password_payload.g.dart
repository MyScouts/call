// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordPayload _$ChangePasswordPayloadFromJson(
        Map<String, dynamic> json) =>
    ChangePasswordPayload(
      currentPassword: json['currentPassword'] as String,
      newPassword: json['newPassword'] as String,
      confirmPassword: json['confirmPassword'] as String,
    );

Map<String, dynamic> _$ChangePasswordPayloadToJson(
        ChangePasswordPayload instance) =>
    <String, dynamic>{
      'currentPassword': instance.currentPassword,
      'newPassword': instance.newPassword,
      'confirmPassword': instance.confirmPassword,
    };
