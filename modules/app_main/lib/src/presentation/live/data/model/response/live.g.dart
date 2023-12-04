// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LiveImpl _$$LiveImplFromJson(Map<String, dynamic> json) => _$LiveImpl(
      lives: (json['lives'] as List<dynamic>?)
          ?.map((e) => LiveDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
    );

Map<String, dynamic> _$$LiveImplToJson(_$LiveImpl instance) =>
    <String, dynamic>{
      'lives': instance.lives?.map((e) => e.toJson()).toList(),
      'total': instance.total,
    };
