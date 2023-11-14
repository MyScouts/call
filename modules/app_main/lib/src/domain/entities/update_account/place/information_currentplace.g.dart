// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'information_currentplace.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InformationDPoneCurrentPlaceImpl _$$InformationDPoneCurrentPlaceImplFromJson(
        Map<String, dynamic> json) =>
    _$InformationDPoneCurrentPlaceImpl(
      countryName: json['countryName'] as String,
      provinceName: json['provinceName'] as String,
      districtName: json['districtName'] as String,
      wardName: json['wardName'] as String,
      street: json['street'] as String,
      address: json['address'] as String,
      countryCode: json['countryCode'] as String?,
      provinceCode: json['provinceCode'] as String?,
      districtCode: json['districtCode'] as String?,
      wardCode: json['wardCode'] as String?,
    );

Map<String, dynamic> _$$InformationDPoneCurrentPlaceImplToJson(
        _$InformationDPoneCurrentPlaceImpl instance) =>
    <String, dynamic>{
      'countryName': instance.countryName,
      'provinceName': instance.provinceName,
      'districtName': instance.districtName,
      'wardName': instance.wardName,
      'street': instance.street,
      'address': instance.address,
      'countryCode': instance.countryCode,
      'provinceCode': instance.provinceCode,
      'districtCode': instance.districtCode,
      'wardCode': instance.wardCode,
    };
