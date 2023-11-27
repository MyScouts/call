import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_data.g.dart';

class NotificationData {
  final int id;
  final String title;
  final bool isRead;
  final String type;
  @Default({})
  final Map<String, dynamic>? metadata;
  final DateTime? createdAt;

  NotificationData({
    required this.title,
    required this.id,
    required this.type,
    required this.isRead,
    required this.createdAt,
    this.metadata,
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
