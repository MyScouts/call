// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_group_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CallGroupDto _$CallGroupDtoFromJson(Map<String, dynamic> json) => CallGroupDto(
      id: json['id'] as int,
      members: (json['members'] as List<dynamic>)
          .map((e) => MemberDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      type: json['type'] as int,
    );

Map<String, dynamic> _$CallGroupDtoToJson(CallGroupDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'members': instance.members,
      'name': instance.name,
      'type': instance.type,
    };
