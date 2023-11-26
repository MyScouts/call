import 'package:app_main/src/domain/entities/notification/notification_data.dart';

abstract class NotificationRepository {
  Future register(String fcmToken);

  Future unregister(String fcmToken);

  Future<List<NotificationData>> list(int page, [int pageSize = 10]);

  Future delete(int id);
}
