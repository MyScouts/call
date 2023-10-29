// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kyc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Kyc _$$_KycFromJson(Map<String, dynamic> json) => _$_Kyc(
      id: json['id'] as int?,
      userId: json['userId'] as int?,
      status: json['status'] as int?,
      kycPassport: json['kycPassport'] as String?,
      kycIdentityFront: json['kycIdentityFront'] as String?,
      kycIdentityBack: json['kycIdentityBack'] as String?,
      portrait: json['portrait'] as String?,
    );

Map<String, dynamic> _$$_KycToJson(_$_Kyc instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'status': instance.status,
      'kycPassport': instance.kycPassport,
      'kycIdentityFront': instance.kycIdentityFront,
      'kycIdentityBack': instance.kycIdentityBack,
      'portrait': instance.portrait,
    };
