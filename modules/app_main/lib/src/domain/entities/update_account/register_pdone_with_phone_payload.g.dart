// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_pdone_with_phone_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterPDoneAccountPayloadImpl _$$RegisterPDoneAccountPayloadImplFromJson(
        Map<String, dynamic> json) =>
    _$RegisterPDoneAccountPayloadImpl(
      phoneNumber: json['phoneNumber'] as String?,
      phoneCode: json['phoneCode'] as String?,
      countryId: json['country_id'] as int?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$RegisterPDoneAccountPayloadImplToJson(
    _$RegisterPDoneAccountPayloadImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('phoneNumber', instance.phoneNumber);
  writeNotNull('phoneCode', instance.phoneCode);
  writeNotNull('country_id', instance.countryId);
  writeNotNull('email', instance.email);
  return val;
}
