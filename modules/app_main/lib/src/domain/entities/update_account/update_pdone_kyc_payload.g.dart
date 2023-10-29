// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_pdone_kyc_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdatePDoneKYCPayloadImpl _$$UpdatePDoneKYCPayloadImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdatePDoneKYCPayloadImpl(
      kycPassport: json['kycPassport'] as String?,
      kycIdentityFront: json['kycIdentityFront'] as String?,
      kycIdentityBack: json['kycIdentityBack'] as String?,
      portrait: json['portrait'] as String,
    );

Map<String, dynamic> _$$UpdatePDoneKYCPayloadImplToJson(
        _$UpdatePDoneKYCPayloadImpl instance) =>
    <String, dynamic>{
      'kycPassport': instance.kycPassport,
      'kycIdentityFront': instance.kycIdentityFront,
      'kycIdentityBack': instance.kycIdentityBack,
      'portrait': instance.portrait,
    };
