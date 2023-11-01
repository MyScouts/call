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

ForgotPasswordPayload _$ForgotPasswordPayloadFromJson(
        Map<String, dynamic> json) =>
    ForgotPasswordPayload(
      phoneNumber: json['phoneNumber'] as String,
      phoneCode: json['phoneCode'] as String,
    );

Map<String, dynamic> _$ForgotPasswordPayloadToJson(
        ForgotPasswordPayload instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'phoneCode': instance.phoneCode,
    };

ResetPasswordTokenPayload _$ResetPasswordTokenPayloadFromJson(
        Map<String, dynamic> json) =>
    ResetPasswordTokenPayload(
      phoneNumber: json['phoneNumber'] as String,
      phoneCode: json['phoneCode'] as String,
      otp: json['otp'] as String,
    );

Map<String, dynamic> _$ResetPasswordTokenPayloadToJson(
        ResetPasswordTokenPayload instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'phoneCode': instance.phoneCode,
      'otp': instance.otp,
    };

ResetPasswordPayload _$ResetPasswordPayloadFromJson(
        Map<String, dynamic> json) =>
    ResetPasswordPayload(
      password: json['password'] as String,
      ott: json['ott'] as String,
    );

Map<String, dynamic> _$ResetPasswordPayloadToJson(
        ResetPasswordPayload instance) =>
    <String, dynamic>{
      'password': instance.password,
      'ott': instance.ott,
    };
