// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp_with_phone_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VerifyOtpWithPhonePayload _$$_VerifyOtpWithPhonePayloadFromJson(
        Map<String, dynamic> json) =>
    _$_VerifyOtpWithPhonePayload(
      token: json['token'] as String,
      phone: json['phone'] as String,
      countryId: json['country_id'] as int,
      phoneCode: json['phoneCode'] as String?,
      otp: json['otp'] as String?,
    );

Map<String, dynamic> _$$_VerifyOtpWithPhonePayloadToJson(
    _$_VerifyOtpWithPhonePayload instance) {
  final val = <String, dynamic>{
    'token': instance.token,
    'phone': instance.phone,
    'country_id': instance.countryId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('phoneCode', instance.phoneCode);
  writeNotNull('otp', instance.otp);
  return val;
}
