// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_public_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserPublicInfoResponseImpl _$$UserPublicInfoResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UserPublicInfoResponseImpl(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserPublicInfoResponseImplToJson(
        _$UserPublicInfoResponseImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
    };
