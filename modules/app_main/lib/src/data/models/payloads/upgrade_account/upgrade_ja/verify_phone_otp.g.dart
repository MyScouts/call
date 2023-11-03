// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_phone_otp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyPhoneOtpPayload _$VerifyPhoneOtpPayloadFromJson(
        Map<String, dynamic> json) =>
    VerifyPhoneOtpPayload(
      token: json['token'] as String,
      otp: json['otp'] as String,
    );

Map<String, dynamic> _$VerifyPhoneOtpPayloadToJson(
        VerifyPhoneOtpPayload instance) =>
    <String, dynamic>{
      'token': instance.token,
      'otp': instance.otp,
    };
