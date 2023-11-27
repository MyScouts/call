// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberDto _$MemberDtoFromJson(Map<String, dynamic> json) => MemberDto(
      member: FriendDto.fromJson(json['member'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MemberDtoToJson(MemberDto instance) => <String, dynamic>{
      'member': instance.member,
    };
