// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_phone_otp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VerifyPhoneOtpPayloadImpl _$$VerifyPhoneOtpPayloadImplFromJson(
        Map<String, dynamic> json) =>
    _$VerifyPhoneOtpPayloadImpl(
      token: json['token'] as String,
      otp: json['otp'] as String,
      teamId: json['teamId'] as String?,
    );

Map<String, dynamic> _$$VerifyPhoneOtpPayloadImplToJson(
        _$VerifyPhoneOtpPayloadImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'otp': instance.otp,
      'teamId': instance.teamId,
    };
