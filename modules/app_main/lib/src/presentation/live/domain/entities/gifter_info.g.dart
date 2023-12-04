// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gifter_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GiversInfoImpl _$$GiversInfoImplFromJson(Map<String, dynamic> json) =>
    _$GiversInfoImpl(
      giver: json['giver'] == null
          ? null
          : User.fromJson(json['giver'] as Map<String, dynamic>),
      diamondCount: json['diamondCount'] as int?,
      festivalUser: json['festivalUser'] == null
          ? null
          : Festival.fromJson(json['festivalUser'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GiversInfoImplToJson(_$GiversInfoImpl instance) =>
    <String, dynamic>{
      'giver': instance.giver,
      'diamondCount': instance.diamondCount,
      'festivalUser': instance.festivalUser,
    };
