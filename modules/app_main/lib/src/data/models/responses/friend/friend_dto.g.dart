// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FriendDto _$FriendDtoFromJson(Map<String, dynamic> json) => FriendDto(
      avatar: json['avatar'] as String?,
      birthday: json['birthday'] as String?,
      displayName: json['displayName'] as String?,
      fullName: json['fullName'] as String?,
      id: json['id'] as int?,
      pDoneId: json['pDoneId'] as String?,
      sexCode: json['sexCode'] as int?,
    );

Map<String, dynamic> _$FriendDtoToJson(FriendDto instance) => <String, dynamic>{
      'avatar': instance.avatar,
      'birthday': instance.birthday,
      'displayName': instance.displayName,
      'fullName': instance.fullName,
      'id': instance.id,
      'pDoneId': instance.pDoneId,
      'sexCode': instance.sexCode,
    };
