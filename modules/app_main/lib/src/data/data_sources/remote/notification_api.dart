import 'package:app_core/app_core.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'notification_api.g.dart';

class NotificationApiConstants {
  static const String register = 'api/notifications/register';
  static const String unregister = 'api/notifications/un-register';
}

@RestApi()
@injectable
abstract class NotificationAPI {
  @factoryMethod
  factory NotificationAPI(Dio dio) = _NotificationAPI;

  @POST(NotificationApiConstants.register)
  Future register(@Body() Map<String, dynamic> body);

  @POST(NotificationApiConstants.unregister)
  Future unregister(@Body() Map<String, dynamic> body);
}
