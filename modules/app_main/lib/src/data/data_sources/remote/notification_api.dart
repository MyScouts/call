import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/responses/notification_data_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'notification_api.g.dart';

class NotificationApiConstants {
  static const String register = 'api/notifications/register';
  static const String unregister = 'api/notifications/un-register';
  static const String list = 'api/v1/notification';
  static const String delete = 'api/v1/notification/{id}';
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

  @GET(NotificationApiConstants.list)
  Future<ListNotificationDataResponse> list(
    @Query('page') int page,
    @Query('pageSize') int pageSize,
  );

  @DELETE(NotificationApiConstants.delete)
  Future delete(@Path('id') int id);
}
