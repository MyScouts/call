// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FriendResponseDto _$FriendResponseDtoFromJson(Map<String, dynamic> json) =>
    FriendResponseDto(
      friends: (json['friends'] as List<dynamic>)
          .map((e) => MemberDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int,
    );

Map<String, dynamic> _$FriendResponseDtoToJson(FriendResponseDto instance) =>
    <String, dynamic>{
      'friends': instance.friends,
      'total': instance.total,
    };
