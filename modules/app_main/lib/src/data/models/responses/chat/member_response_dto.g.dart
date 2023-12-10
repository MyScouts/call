// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberResponseDto _$MemberResponseDtoFromJson(Map<String, dynamic> json) =>
    MemberResponseDto(
      MemberDto.fromJson(json['member'] as Map<String, dynamic>),
      json['type'] as int?,
    );

Map<String, dynamic> _$MemberResponseDtoToJson(MemberResponseDto instance) =>
    <String, dynamic>{
      'member': instance.member,
      'type': instance.type,
    };
