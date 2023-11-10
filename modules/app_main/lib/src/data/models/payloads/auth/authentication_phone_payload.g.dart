// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_phone_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterPhonePayload _$RegisterPhonePayloadFromJson(
        Map<String, dynamic> json) =>
    RegisterPhonePayload(
      phoneNumber: json['phoneNumber'] as String,
      password: json['password'] as String,
      phoneCode: json['phoneCode'] as String,
      birthday: json['birthday'] as String,
      sex: json['sex'] as int,
    );

Map<String, dynamic> _$RegisterPhonePayloadToJson(
        RegisterPhonePayload instance) =>
    <String, dynamic>{
      'phoneCode': instance.phoneCode,
      'phoneNumber': instance.phoneNumber,
      'password': instance.password,
      'birthday': instance.birthday,
      'sex': instance.sex,
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
