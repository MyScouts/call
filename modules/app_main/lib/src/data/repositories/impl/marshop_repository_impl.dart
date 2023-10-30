import 'package:app_main/src/data/data_sources/remote/marshop_api.dart';
import 'package:app_main/src/data/models/payloads/marshop/marshop_payload.dart';
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
}
