import 'package:app_main/src/data/data_sources/remote/marshop_api.dart';
import 'package:app_main/src/data/models/payloads/marshop/marshop_payload.dart';
import 'package:app_main/src/data/models/responses/marshop_response.dart';
import 'package:app_main/src/data/repositories/marshop_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: MarshopRepository)
class MarshopRepositoryImpl extends MarshopRepository {
  final MarshopAPI _marshopAPI;

  MarshopRepositoryImpl(
    this._marshopAPI,
  );

  @override
  Future registerCustomer(RegisterCustomerPayload payload) {
    return _marshopAPI.register(payload);
  }

  @override
  Future registerMarshop(int userId, RegisterMarshopPayload payload) {
    return _marshopAPI.registerMarshop(userId, payload);
  }

  @override
  Future<ListMarshopResponse> getMarShops(GetListMarshopPayload payload) {
    return _marshopAPI.listMarshop(payload);
  }

  @override
  Future<MarshopResponse> getMarShop(GetMarshopInfoPayload payload) {
    return _marshopAPI.getMarshop(payload);
  }

  @override
  Future<MarshopRegisterPacksResponse> getRegisterPacks() =>
      _marshopAPI.getRegisterPacks();
}
