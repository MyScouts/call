// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileInfoImpl _$$UserProfileInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$UserProfileInfoImpl(
      birthday: json['birthday'] == null
          ? null
          : DateTime.parse(json['birthday'] as String),
    );

Map<String, dynamic> _$$UserProfileInfoImplToJson(
        _$UserProfileInfoImpl instance) =>
    <String, dynamic>{
      'birthday': instance.birthday?.toIso8601String(),
    };
