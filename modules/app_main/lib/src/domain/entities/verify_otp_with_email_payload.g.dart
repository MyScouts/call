// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp_with_email_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VerifyOtpWithEmailPayloadImpl _$$VerifyOtpWithEmailPayloadImplFromJson(
        Map<String, dynamic> json) =>
    _$VerifyOtpWithEmailPayloadImpl(
      email: json['email'] as String,
      otp: json['otp'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$$VerifyOtpWithEmailPayloadImplToJson(
        _$VerifyOtpWithEmailPayloadImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'otp': instance.otp,
      'token': instance.token,
    };
