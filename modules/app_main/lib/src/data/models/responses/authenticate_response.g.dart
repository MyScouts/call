// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authenticate_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };

PhoneCompleteRegister _$PhoneCompleteRegisterFromJson(
        Map<String, dynamic> json) =>
    PhoneCompleteRegister(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$PhoneCompleteRegisterToJson(
        PhoneCompleteRegister instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };

ResetPasswordTokenResponse _$ResetPasswordTokenResponseFromJson(
        Map<String, dynamic> json) =>
    ResetPasswordTokenResponse(
      ott: json['ott'] as String,
    );

Map<String, dynamic> _$ResetPasswordTokenResponseToJson(
        ResetPasswordTokenResponse instance) =>
    <String, dynamic>{
      'ott': instance.ott,
    };

ResetPasswordResponse _$ResetPasswordResponseFromJson(
        Map<String, dynamic> json) =>
    ResetPasswordResponse(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$ResetPasswordResponseToJson(
        ResetPasswordResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
