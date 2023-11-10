import 'package:app_main/src/domain/entities/notification/notification_data.dart';
import 'package:app_main/src/domain/entities/notification/notification_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_data_response.g.dart';

@JsonSerializable()
class ListNotificationDataResponse {
  final List<NotificationDataResponse> rows;

  ListNotificationDataResponse(this.rows);

  factory ListNotificationDataResponse.fromJson(Map<String, dynamic> json) =>
      _$ListNotificationDataResponseFromJson(json);
}

@JsonSerializable()
class NotificationDataResponse extends NotificationData {
  NotificationDataResponse({
    required super.id,
    required super.userId,
    required super.fromUserId,
    required super.type,
    required super.read,
    required super.createdAt,
    required super.message,
    required super.commentId,
    required super.fromUser,
    required super.metadata,
    required super.orderId,
    required super.postId,
    required super.productId,
  });

  factory NotificationDataResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationDataResponseFromJson(json);
}
