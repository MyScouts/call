import 'package:app_main/src/data/models/payloads/marshop/marshop_payload.dart';

abstract class MarshopRepository {
  Future registerCustomer(RegisterCustomerPayload payload);
}
