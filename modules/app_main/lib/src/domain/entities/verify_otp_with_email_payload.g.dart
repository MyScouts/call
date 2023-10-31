// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp_with_email_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VerifyOtpWithEmailPayload _$$_VerifyOtpWithEmailPayloadFromJson(
        Map<String, dynamic> json) =>
    _$_VerifyOtpWithEmailPayload(
      email: json['email'] as String,
      otp: json['otp'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$$_VerifyOtpWithEmailPayloadToJson(
        _$_VerifyOtpWithEmailPayload instance) =>
    <String, dynamic>{
      'email': instance.email,
      'otp': instance.otp,
      'token': instance.token,
    };
