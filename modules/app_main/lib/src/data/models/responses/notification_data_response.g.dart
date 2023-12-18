// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListNotificationDataResponse _$ListNotificationDataResponseFromJson(
        Map<String, dynamic> json) =>
    ListNotificationDataResponse(
      (json['notifications'] as List<dynamic>)
          .map((e) =>
              NotificationDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListNotificationDataResponseToJson(
        ListNotificationDataResponse instance) =>
    <String, dynamic>{
      'notifications': instance.rows,
    };

NotificationDataResponse _$NotificationDataResponseFromJson(
        Map<String, dynamic> json) =>
    NotificationDataResponse(
      title: json['title'] as String,
      id: json['id'] as int,
      type: json['type'] as String,
      isRead: json['isRead'] as bool,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      metadata: json['metadata'] as Map<String, dynamic>?,
      body: json['body'] as String,
    );

Map<String, dynamic> _$NotificationDataResponseToJson(
        NotificationDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'isRead': instance.isRead,
      'type': instance.type,
      'body': instance.body,
      'metadata': instance.metadata,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
