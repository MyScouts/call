import 'package:app_main/src/data/models/payloads/marshop/marshop_payload.dart';
import 'package:app_main/src/data/models/responses/marshop_response.dart';

abstract class MarshopRepository {
  Future registerCustomer(RegisterCustomerPayload payload);
  Future registerMarshop(int userId, RegisterMarshopPayload payload);
  Future<ListMarshopResponse> getMarShops(GetListMarshopPayload payload);
  Future<MarshopResponse> getMarShop(GetMarshopInfoPayload payload);
}
