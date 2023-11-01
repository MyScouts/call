import 'package:app_main/src/data/repositories/notification_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class NotificationUsecase {
  final NotificationRepository _notificationRepository;

  NotificationUsecase(this._notificationRepository);

  Future register(String fcmToken) async {
    await _notificationRepository.register(fcmToken);
  }

  Future unregister(String fcmToken) async {
    await _notificationRepository.unregister(fcmToken);
  }
}
