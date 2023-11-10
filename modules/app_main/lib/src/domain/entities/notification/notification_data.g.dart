// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationUserModel _$NotificationUserModelFromJson(
        Map<String, dynamic> json) =>
    NotificationUserModel(
      id: json['id'] as int,
      avatar: json['avatar'] as String,
      displayName: json['displayName'] as String,
      isPDone: json['isPDone'] as bool,
      hexId: json['hexId'] as String,
      pDoneId: json['pDoneId'] as String,
    );

Map<String, dynamic> _$NotificationUserModelToJson(
        NotificationUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'avatar': instance.avatar,
      'pDoneId': instance.pDoneId,
      'hexId': instance.hexId,
      'displayName': instance.displayName,
      'isPDone': instance.isPDone,
    };
