// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_phone_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationPhonePayload _$AuthenticationPhonePayloadFromJson(
        Map<String, dynamic> json) =>
    AuthenticationPhonePayload(
      phone: json['phone'] as String,
      password: json['password'] as String,
      countryId: json['country_id'] as int,
    );

Map<String, dynamic> _$AuthenticationPhonePayloadToJson(
        AuthenticationPhonePayload instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'password': instance.password,
      'country_id': instance.countryId,
    };
