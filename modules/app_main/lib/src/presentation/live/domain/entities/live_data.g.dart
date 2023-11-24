// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LiveData _$LiveDataFromJson(Map<String, dynamic> json) => LiveData(
      id: json['id'] as int,
      userID: json['userId'] as int,
      title: json['title'] as String,
      type: json['type'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      agoraChannel: json['agoraChannel'] as String?,
      agoraToken: json['agoraToken'] as String?,
    );

Map<String, dynamic> _$LiveDataToJson(LiveData instance) => <String, dynamic>{
      'userId': instance.userID,
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'createdAt': instance.createdAt.toIso8601String(),
      'agoraChannel': instance.agoraChannel,
      'agoraToken': instance.agoraToken,
    };
