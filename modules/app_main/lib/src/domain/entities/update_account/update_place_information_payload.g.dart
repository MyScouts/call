// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_place_information_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UpdatePlaceInformationPayload _$$_UpdatePlaceInformationPayloadFromJson(
        Map<String, dynamic> json) =>
    _$_UpdatePlaceInformationPayload(
      country: json['country'] as String?,
      province: json['province'] as int?,
      district: json['district'] as String?,
      ward: json['ward'] as int?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$$_UpdatePlaceInformationPayloadToJson(
        _$_UpdatePlaceInformationPayload instance) =>
    <String, dynamic>{
      'country': instance.country,
      'province': instance.province,
      'district': instance.district,
      'ward': instance.ward,
      'address': instance.address,
    };
