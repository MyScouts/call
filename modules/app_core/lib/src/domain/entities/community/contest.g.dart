// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContestImpl _$$ContestImplFromJson(Map<String, dynamic> json) =>
    _$ContestImpl(
      id: json['id'] as int?,
      contestId: json['contestId'] as int?,
      name: json['name'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$ContestImplToJson(_$ContestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'contestId': instance.contestId,
      'name': instance.name,
      'status': instance.status,
    };
