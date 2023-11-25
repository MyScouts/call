// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marshop_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterCustomerPayload _$RegisterCustomerPayloadFromJson(
        Map<String, dynamic> json) =>
    RegisterCustomerPayload(
      marshopId: json['marshopId'] as String,
      otp: json['otp'] as String,
    );

Map<String, dynamic> _$RegisterCustomerPayloadToJson(
        RegisterCustomerPayload instance) =>
    <String, dynamic>{
      'otp': instance.otp,
      'marshopId': instance.marshopId,
    };

RegisterMarshopPayload _$RegisterMarshopPayloadFromJson(
        Map<String, dynamic> json) =>
    RegisterMarshopPayload(
      name: json['name'] as String,
      referralId: json['referralId'] as String?,
      otp: json['otp'] as String,
    );

Map<String, dynamic> _$RegisterMarshopPayloadToJson(
    RegisterMarshopPayload instance) {
  final val = <String, dynamic>{
    'otp': instance.otp,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('referralId', instance.referralId);
  return val;
}
