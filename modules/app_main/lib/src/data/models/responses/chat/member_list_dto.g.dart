// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberListDto _$MemberListDtoFromJson(Map<String, dynamic> json) =>
    MemberListDto(
      count: json['count'] as int,
      members: (json['members'] as List<dynamic>)
          .map((e) => MemberResponseDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MemberListDtoToJson(MemberListDto instance) =>
    <String, dynamic>{
      'count': instance.count,
      'members': instance.members,
    };
