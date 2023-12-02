import 'package:app_main/src/data/models/payloads/marshop/marshop_payload.dart';
import 'package:app_main/src/data/models/responses/marshop_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'marshop_api.g.dart';

class MarshopApiConstant {
  static const String customerRegister = "api/v1/marshop/customer/register";
  static const String registerMarshop = "api/v1/marshop/{userId}";
  static const String listMarshop = "api/v1/marshop/list";
  static const String marshopInfo = "api/v1/marshop/user";
  static const String registerPack = "api/v1/marshop/register-packs";
}

@RestApi()
@injectable
abstract class MarshopAPI {
  @factoryMethod
  factory MarshopAPI(Dio dio) = _MarshopAPI;

  @POST(MarshopApiConstant.customerRegister)
  Future register(@Body() RegisterCustomerPayload body);

  @POST(MarshopApiConstant.registerMarshop)
  Future registerMarshop(
    @Path() int userId,
    @Body() RegisterMarshopPayload body,
  );

  @GET(MarshopApiConstant.listMarshop)
  Future<ListMarshopResponse> listMarshop(
    @Queries() GetListMarshopPayload query,
  );

  @GET(MarshopApiConstant.marshopInfo)
  Future<MarshopResponse> getMarshop(
    @Queries() GetMarshopInfoPayload query,
  );

  @GET(MarshopApiConstant.registerPack)
  Future<MarshopRegisterPacksResponse> getRegisterPacks();
}
