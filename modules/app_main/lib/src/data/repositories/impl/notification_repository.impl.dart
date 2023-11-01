import 'package:app_main/src/data/data_sources/remote/notification_api.dart';
import 'package:app_main/src/data/repositories/notification_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: NotificationRepository)
class NotificationRepositoryImpl extends NotificationRepository {
  final NotificationAPI _notificationApi;

  NotificationRepositoryImpl(this._notificationApi);

  @override
  Future register(String fcmToken) async {
    final response = await _notificationApi.register({'token': fcmToken});
    return response.data;
  }

  @override
  Future unregister(String fcmToken) async {
    final response = await _notificationApi.unregister({'token': fcmToken});
    return response.data;
  }
}
