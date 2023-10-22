// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_with_phone_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterWithPhoneResponse _$RegisterWithPhoneResponseFromJson(
        Map<String, dynamic> json) =>
    RegisterWithPhoneResponse(
      token: json['token'] as String,
      phone: json['phone'] as String,
      otpExpiresTime: json['otpExpiresTime'] as String?,
      phoneCode: json['phoneCode'] as String?,
    );

Map<String, dynamic> _$RegisterWithPhoneResponseToJson(
        RegisterWithPhoneResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'phone': instance.phone,
      'otpExpiresTime': instance.otpExpiresTime,
      'phoneCode': instance.phoneCode,
    };
