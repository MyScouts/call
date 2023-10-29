// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_place_information_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdatePlaceInformationPayloadImpl
    _$$UpdatePlaceInformationPayloadImplFromJson(Map<String, dynamic> json) =>
        _$UpdatePlaceInformationPayloadImpl(
          country: json['country'] as String?,
          province: json['province'] as int?,
          district: json['district'] as String?,
          ward: json['ward'] as int?,
          address: json['address'] as String?,
        );

Map<String, dynamic> _$$UpdatePlaceInformationPayloadImplToJson(
        _$UpdatePlaceInformationPayloadImpl instance) =>
    <String, dynamic>{
      'country': instance.country,
      'province': instance.province,
      'district': instance.district,
      'ward': instance.ward,
      'address': instance.address,
    };
