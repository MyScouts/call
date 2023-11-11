// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdone_verify_otp_protector.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PDoneVerifyOTPProtectorRequest _$PDoneVerifyOTPProtectorRequestFromJson(
        Map<String, dynamic> json) =>
    PDoneVerifyOTPProtectorRequest(
      requestId: json['requestId'] as String?,
      otp: json['otp'] as String?,
    );

Map<String, dynamic> _$PDoneVerifyOTPProtectorRequestToJson(
        PDoneVerifyOTPProtectorRequest instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'otp': instance.otp,
    };
