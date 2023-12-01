import 'package:app_main/src/data/models/payloads/marshop/marshop_payload.dart';
import 'package:app_main/src/data/models/responses/marshop_response.dart';
import 'package:app_main/src/data/repositories/marshop_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class MarshopUsecase {
  final MarshopRepository _marshopRepository;

  MarshopUsecase(
    this._marshopRepository,
  );

  Future registerCustomer(RegisterCustomerPayload payload) {
    return _marshopRepository.registerCustomer(payload);
  }

  Future registerMarshop(int userId, RegisterMarshopPayload payload) {
    return _marshopRepository.registerMarshop(userId, payload);
  }

  Future<List<MarshopResponse>> getMarShops(
      GetListMarshopPayload payload) async {
    final response = await _marshopRepository.getMarShops(payload);
    return response.marshops;
  }

  Future<MarshopResponse> getMarShop(GetMarshopInfoPayload payload) async {
    return _marshopRepository.getMarShop(payload);
  }
}
