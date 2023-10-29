// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlaceInformationImpl _$$PlaceInformationImplFromJson(
        Map<String, dynamic> json) =>
    _$PlaceInformationImpl(
      country: json['country'] == null
          ? null
          : Country.fromJson(json['country'] as Map<String, dynamic>),
      province: json['province'] == null
          ? null
          : Province.fromJson(json['province'] as Map<String, dynamic>),
      district: json['district'] == null
          ? null
          : District.fromJson(json['district'] as Map<String, dynamic>),
      ward: json['ward'] == null
          ? null
          : Ward.fromJson(json['ward'] as Map<String, dynamic>),
      address: json['address'] as String?,
    );

Map<String, dynamic> _$$PlaceInformationImplToJson(
        _$PlaceInformationImpl instance) =>
    <String, dynamic>{
      'country': instance.country,
      'province': instance.province,
      'district': instance.district,
      'ward': instance.ward,
      'address': instance.address,
    };
