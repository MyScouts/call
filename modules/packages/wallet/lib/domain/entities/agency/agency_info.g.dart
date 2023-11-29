// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agency_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgencyListResponse _$AgencyListResponseFromJson(Map<String, dynamic> json) =>
    AgencyListResponse(
      coinAgencies: (json['coinAgencies'] as List<dynamic>)
          .map((e) => AgencyResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AgencyListResponseToJson(AgencyListResponse instance) =>
    <String, dynamic>{
      'coinAgencies': instance.coinAgencies,
    };
