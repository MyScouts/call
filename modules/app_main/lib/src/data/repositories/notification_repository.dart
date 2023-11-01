abstract class NotificationRepository {
  Future register(String fcmToken);
  Future unregister(String fcmToken);
}
