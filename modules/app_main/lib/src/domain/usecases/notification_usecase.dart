import 'package:app_main/src/data/repositories/notification_repository.dart';
import 'package:app_main/src/domain/entities/notification/notification_data.dart';
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

  Future<List<NotificationData>> list(int page) async {
    return _notificationRepository.list(page);
  }

  Future delete(int id) {
    return _notificationRepository.delete(id);
  }
}
