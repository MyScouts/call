// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationDto _$ConversationDtoFromJson(Map<String, dynamic> json) =>
    ConversationDto(
      countUnSeen: json['countUnSeen'] as int,
      id: json['id'] as int,
      latestMessage: json['latestMessage'] == null
          ? null
          : MessageDto.fromJson(json['latestMessage'] as Map<String, dynamic>),
      members: (json['members'] as List<dynamic>)
          .map((e) => MemberResponseDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      type: json['type'] as int,
    );

Map<String, dynamic> _$ConversationDtoToJson(ConversationDto instance) =>
    <String, dynamic>{
      'countUnSeen': instance.countUnSeen,
      'id': instance.id,
      'latestMessage': instance.latestMessage,
      'members': instance.members,
      'name': instance.name,
      'type': instance.type,
    };
