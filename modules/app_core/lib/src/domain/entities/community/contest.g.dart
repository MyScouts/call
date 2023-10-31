// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Contest _$$_ContestFromJson(Map<String, dynamic> json) => _$_Contest(
      id: json['id'] as int?,
      contestId: json['contestId'] as int?,
      name: json['name'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$_ContestToJson(_$_Contest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'contestId': instance.contestId,
      'name': instance.name,
      'status': instance.status,
    };
