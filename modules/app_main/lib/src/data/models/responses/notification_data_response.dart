import 'package:app_main/src/domain/entities/notification/notification_data.dart';
import 'package:app_main/src/domain/entities/notification/notification_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_data_response.g.dart';

@JsonSerializable()
class ListNotificationDataResponse {
  @JsonKey(name: 'notifications')
  final List<NotificationDataResponse> rows;

  ListNotificationDataResponse(this.rows);

  factory ListNotificationDataResponse.fromJson(Map<String, dynamic> json) =>
      _$ListNotificationDataResponseFromJson(json);
}

@JsonSerializable()
class NotificationDataResponse extends NotificationData {
  NotificationDataResponse({
    required super.title,
    required super.id,
    required super.type,
    required super.isRead,
    required super.createdAt,
    super.metadata,
  });

  factory NotificationDataResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationDataResponseFromJson(json);
}
