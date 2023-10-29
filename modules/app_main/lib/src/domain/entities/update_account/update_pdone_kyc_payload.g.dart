// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_pdone_kyc_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UpdatePDoneKYCPayload _$$_UpdatePDoneKYCPayloadFromJson(
        Map<String, dynamic> json) =>
    _$_UpdatePDoneKYCPayload(
      kycPassport: json['kycPassport'] as String?,
      kycIdentityFront: json['kycIdentityFront'] as String?,
      kycIdentityBack: json['kycIdentityBack'] as String?,
      portrait: json['portrait'] as String,
    );

Map<String, dynamic> _$$_UpdatePDoneKYCPayloadToJson(
        _$_UpdatePDoneKYCPayload instance) =>
    <String, dynamic>{
      'kycPassport': instance.kycPassport,
      'kycIdentityFront': instance.kycIdentityFront,
      'kycIdentityBack': instance.kycIdentityBack,
      'portrait': instance.portrait,
    };
