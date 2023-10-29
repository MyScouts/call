// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_phone_register_pdone_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VerifyOtpPDonePayload _$$_VerifyOtpPDonePayloadFromJson(
        Map<String, dynamic> json) =>
    _$_VerifyOtpPDonePayload(
      token: json['token'] as String?,
      phone: json['phone'] as String?,
      phoneCode: json['phoneCode'] as String?,
      email: json['email'] as String?,
      otp: json['otp'] as String,
    );

Map<String, dynamic> _$$_VerifyOtpPDonePayloadToJson(
    _$_VerifyOtpPDonePayload instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('token', instance.token);
  writeNotNull('phone', instance.phone);
  writeNotNull('phoneCode', instance.phoneCode);
  writeNotNull('email', instance.email);
  val['otp'] = instance.otp;
  return val;
}
