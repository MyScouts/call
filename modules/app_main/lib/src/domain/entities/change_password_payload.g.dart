// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordPayload _$ChangePasswordPayloadFromJson(
        Map<String, dynamic> json) =>
    ChangePasswordPayload(
      oldPassword: json['oldPassword'] as String,
      newPassword: json['newPassword'] as String,
    );

Map<String, dynamic> _$ChangePasswordPayloadToJson(
        ChangePasswordPayload instance) =>
    <String, dynamic>{
      'oldPassword': instance.oldPassword,
      'newPassword': instance.newPassword,
    };
