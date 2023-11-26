import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/responses/list_protector_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'protector_api.g.dart';

class ProtectorAPIConstant {
  static const String listProtector = 'api/v1/protector/list-protector';
  static const String listProtectorRequest = 'api/v1/protector/request';
  static const String replyRequest = 'api/v1/protector/reply-request';
  static const String myProtector = 'api/v1/protector/my-protector';
}

@lazySingleton
@RestApi()
abstract class ProtectorAPI {
  @factoryMethod
  factory ProtectorAPI(Dio dio) => _ProtectorAPI(dio);

  @GET(ProtectorAPIConstant.listProtector)
  Future<ListProtectorResponse> list();

  @GET(ProtectorAPIConstant.listProtectorRequest)
  Future<ListProtectorRequestResponse> requests();

  @POST(ProtectorAPIConstant.replyRequest)
  Future<ReplyRequestResponse> replyRequest(
    @Body() Map<String, dynamic> payload,
  );

  @GET(ProtectorAPIConstant.myProtector)
  Future<MyProtectorResponse> myProtector();
}
