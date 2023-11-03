// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_place_information_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdatePlaceInformationPayloadImpl
    _$$UpdatePlaceInformationPayloadImplFromJson(Map<String, dynamic> json) =>
        _$UpdatePlaceInformationPayloadImpl(
          address: json['address'] as String?,
          provinceName: json['provinceName'] as String?,
          districtName: json['districtName'] as String?,
          wardName: json['wardName'] as String?,
          street: json['street'] as String?,
          provinceCode: json['provinceCode'] as String?,
          districtCode: json['districtCode'] as String?,
          wardCode: json['wardCode'] as String?,
        );

Map<String, dynamic> _$$UpdatePlaceInformationPayloadImplToJson(
        _$UpdatePlaceInformationPayloadImpl instance) =>
    <String, dynamic>{
      'address': instance.address,
      'provinceName': instance.provinceName,
      'districtName': instance.districtName,
      'wardName': instance.wardName,
      'street': instance.street,
      'provinceCode': instance.provinceCode,
      'districtCode': instance.districtCode,
      'wardCode': instance.wardCode,
    };
