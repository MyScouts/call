// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marshop_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterCustomerPayload _$RegisterCustomerPayloadFromJson(
        Map<String, dynamic> json) =>
    RegisterCustomerPayload(
      marshopId: json['marshopId'] as int,
      otp: json['otp'] as String,
    );

Map<String, dynamic> _$RegisterCustomerPayloadToJson(
        RegisterCustomerPayload instance) =>
    <String, dynamic>{
      'otp': instance.otp,
      'marshopId': instance.marshopId,
    };
