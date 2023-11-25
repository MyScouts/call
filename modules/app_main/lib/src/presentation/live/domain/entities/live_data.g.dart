// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LiveData _$LiveDataFromJson(Map<String, dynamic> json) => LiveData(
      id: json['id'] as int,
      userID: json['userId'] as int?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      title: json['title'] as String,
      type: $enumDecode(_$LiveTypeEnumMap, json['type']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      agoraChannel: json['agoraChannel'] as String?,
      agoraToken: json['agoraToken'] as String?,
    );

Map<String, dynamic> _$LiveDataToJson(LiveData instance) => <String, dynamic>{
      'userId': instance.userID,
      'user': instance.user,
      'id': instance.id,
      'type': _$LiveTypeEnumMap[instance.type]!,
      'title': instance.title,
      'createdAt': instance.createdAt.toIso8601String(),
      'agoraChannel': instance.agoraChannel,
      'agoraToken': instance.agoraToken,
    };

const _$LiveTypeEnumMap = {
  LiveType.public: 'public',
  LiveType.password_locked: 'password_locked',
  LiveType.friend_only: 'friend_only',
  LiveType.follower_only: 'follower_only',
  LiveType.contest: 'contest',
  LiveType.only_me: 'only_me',
};
