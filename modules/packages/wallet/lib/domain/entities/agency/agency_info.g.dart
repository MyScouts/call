// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agency_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AgencyInfoImpl _$$AgencyInfoImplFromJson(Map<String, dynamic> json) =>
    _$AgencyInfoImpl(
      agency: json['agency'] == null
          ? null
          : Agency.fromJson(json['agency'] as Map<String, dynamic>),
      listPrice: (json['listPrice'] as List<dynamic>?)
          ?.map((e) => AgencyPrice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AgencyInfoImplToJson(_$AgencyInfoImpl instance) =>
    <String, dynamic>{
      'agency': instance.agency,
      'listPrice': instance.listPrice,
    };

_$AgencyPriceImpl _$$AgencyPriceImplFromJson(Map<String, dynamic> json) =>
    _$AgencyPriceImpl(
      id: json['id'] as int?,
      vndFrom: json['vndFrom'] as int?,
      pointPrice: json['pointPrice'] as String?,
    );

Map<String, dynamic> _$$AgencyPriceImplToJson(_$AgencyPriceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vndFrom': instance.vndFrom,
      'pointPrice': instance.pointPrice,
    };
