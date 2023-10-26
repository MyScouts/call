// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_phone_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationPhonePayload _$AuthenticationPhonePayloadFromJson(
        Map<String, dynamic> json) =>
    AuthenticationPhonePayload(
      phoneNumber: json['phoneNumber'] as String,
      password: json['password'] as String,
      phoneCode: json['phoneCode'] as String,
    );

Map<String, dynamic> _$AuthenticationPhonePayloadToJson(
        AuthenticationPhonePayload instance) =>
    <String, dynamic>{
      'phoneCode': instance.phoneCode,
      'phoneNumber': instance.phoneNumber,
      'password': instance.password,
    };

CompletedPhoneRegisterPayload _$CompletedPhoneRegisterPayloadFromJson(
        Map<String, dynamic> json) =>
    CompletedPhoneRegisterPayload(
      phoneNumber: json['phoneNumber'] as String,
      otp: json['otp'] as String,
      phoneCode: json['phoneCode'] as String,
    );

Map<String, dynamic> _$CompletedPhoneRegisterPayloadToJson(
        CompletedPhoneRegisterPayload instance) =>
    <String, dynamic>{
      'phoneCode': instance.phoneCode,
      'phoneNumber': instance.phoneNumber,
      'otp': instance.otp,
    };
