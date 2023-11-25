// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agency_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgencyResponse _$AgencyResponseFromJson(Map<String, dynamic> json) =>
    AgencyResponse(
      agencies: (json['agencies'] as List<dynamic>)
          .map((e) => Agency.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AgencyResponseToJson(AgencyResponse instance) =>
    <String, dynamic>{
      'agencies': instance.agencies,
    };
