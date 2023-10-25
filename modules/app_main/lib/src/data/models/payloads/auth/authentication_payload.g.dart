// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationPayload _$AuthenticationPayloadFromJson(
        Map<String, dynamic> json) =>
    AuthenticationPayload(
      username: json['username'] as String,
      password: json['password'] as String,
      countryId: json['countryId'] as int,
    );

Map<String, dynamic> _$AuthenticationPayloadToJson(
        AuthenticationPayload instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'countryId': instance.countryId,
    };
