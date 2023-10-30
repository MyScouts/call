import 'package:app_main/src/data/models/payloads/marshop/marshop_payload.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'marshop_api.g.dart';

class MarshopApiConstant {
  static const String register = "api/v1/marshop/customer/register";
}

@RestApi()
@injectable
abstract class MarshopAPI {
  @factoryMethod
  factory MarshopAPI(Dio dio) = _MarshopAPI;

  @POST(MarshopApiConstant.register)
  Future register(@Body() RegisterCustomerPayload body);
}
