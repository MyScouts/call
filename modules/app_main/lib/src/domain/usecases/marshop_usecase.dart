import 'package:app_main/src/data/models/payloads/marshop/marshop_payload.dart';
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
}
