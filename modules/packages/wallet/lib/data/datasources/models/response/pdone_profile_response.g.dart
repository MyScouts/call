// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdone_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PDoneProfileResponse _$PDoneProfileResponseFromJson(
        Map<String, dynamic> json) =>
    PDoneProfileResponse(
      profile: json['profile'] == null
          ? null
          : PDoneProfile.fromJson(json['profile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PDoneProfileResponseToJson(
        PDoneProfileResponse instance) =>
    <String, dynamic>{
      'profile': instance.profile,
    };
