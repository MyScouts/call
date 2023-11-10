// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListNotificationDataResponse _$ListNotificationDataResponseFromJson(
        Map<String, dynamic> json) =>
    ListNotificationDataResponse(
      (json['rows'] as List<dynamic>)
          .map((e) =>
              NotificationDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListNotificationDataResponseToJson(
        ListNotificationDataResponse instance) =>
    <String, dynamic>{
      'rows': instance.rows,
    };

NotificationDataResponse _$NotificationDataResponseFromJson(
        Map<String, dynamic> json) =>
    NotificationDataResponse(
      id: json['id'] as int,
      userId: json['userId'] as int,
      fromUserId: json['fromUserId'] as int?,
      type: NotificationType.fromJson(json['type']),
      read: json['read'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      message: json['message'] as String,
      commentId: json['commentId'] as int?,
      fromUser: json['fromUser'] == null
          ? null
          : NotificationUserModel.fromJson(
              json['fromUser'] as Map<String, dynamic>),
      metadata: json['metadata'] as Map<String, dynamic>?,
      orderId: json['orderId'] as int?,
      postId: json['postId'] as int?,
      productId: json['productId'] as int?,
    );

Map<String, dynamic> _$NotificationDataResponseToJson(
        NotificationDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'fromUserId': instance.fromUserId,
      'postId': instance.postId,
      'commentId': instance.commentId,
      'type': _$NotificationTypeEnumMap[instance.type]!,
      'message': instance.message,
      'productId': instance.productId,
      'orderId': instance.orderId,
      'read': instance.read,
      'metadata': instance.metadata,
      'createdAt': instance.createdAt.toIso8601String(),
      'fromUser': instance.fromUser,
    };

const _$NotificationTypeEnumMap = {
  NotificationType.system: 'system',
  NotificationType.follow: 'follow',
  NotificationType.likePost: 'likePost',
  NotificationType.commentPost: 'commentPost',
  NotificationType.postNews: 'postNews',
  NotificationType.friended: 'friended',
  NotificationType.replayComment: 'replayComment',
  NotificationType.joinLive: 'joinLive',
  NotificationType.userOrder: 'userOrder',
  NotificationType.newProduct: 'newProduct',
  NotificationType.rejectPDone: 'rejectPDone',
  NotificationType.hostStartLive: 'hostStartLive',
  NotificationType.fanGroup: 'fanGroup',
};
