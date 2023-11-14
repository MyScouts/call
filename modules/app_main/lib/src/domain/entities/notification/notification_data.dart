import 'package:app_main/src/domain/entities/notification/notification_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_data.g.dart';


class NotificationData {
  final int id;
  final int userId;
  final int? fromUserId;
  final int? postId;
  final int? commentId;
  final NotificationType type;
  final String message;
  final int? productId;
  final int? orderId;
  final bool read;
  @Default({})
  final Map<String, dynamic>? metadata;
  final DateTime createdAt;
  final NotificationUserModel? fromUser;

  NotificationData({
    required this.id,
    required this.userId,
    required this.type,
    required this.read,
    required this.createdAt,
    this.fromUserId,
    this.postId,
    this.metadata,
    required this.message,
    this.fromUser,
    this.commentId,
    this.orderId,
    this.productId,
  });
}

@JsonSerializable()
class NotificationUserModel {
  final int id;
  final String? avatar;
  final String pDoneId;
  final String hexId;
  final String displayName;
  final bool isPDone;

  NotificationUserModel({
    required this.id,
    this.avatar,
    required this.displayName,
    required this.isPDone,
    required this.hexId,
    required this.pDoneId,
  });

  factory NotificationUserModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationUserModelFromJson(json);
}
