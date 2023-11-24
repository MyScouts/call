// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AgencyImpl _$$AgencyImplFromJson(Map<String, dynamic> json) => _$AgencyImpl(
      id: json['id'] as int?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      pDoneId: json['pDoneId'] as String?,
      displayName: json['displayName'] as String?,
      agencyName: json['agencyName'] as String?,
      totalPoint: json['totalPoint'] as int?,
    );

Map<String, dynamic> _$$AgencyImplToJson(_$AgencyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phone': instance.phone,
      'email': instance.email,
      'pDoneId': instance.pDoneId,
      'displayName': instance.displayName,
      'agencyName': instance.agencyName,
      'totalPoint': instance.totalPoint,
    };
