// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_detail_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationDetailResponseDto _$ConversationDetailResponseDtoFromJson(
        Map<String, dynamic> json) =>
    ConversationDetailResponseDto(
      conversation: ConversationDto.fromJson(
          json['conversation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ConversationDetailResponseDtoToJson(
        ConversationDetailResponseDto instance) =>
    <String, dynamic>{
      'conversation': instance.conversation,
    };
