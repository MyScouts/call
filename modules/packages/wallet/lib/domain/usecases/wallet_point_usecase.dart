import 'package:injectable/injectable.dart';

import '../../data/datasources/models/est_coin_response.dart';
import '../../data/datasources/models/exchange_coin_response.dart';
import '../../data/datasources/models/request/agency_get_payment_information_request.dart';
import '../../data/datasources/models/request/buy_coin_request.dart';
import '../../data/datasources/models/wallet_coin_payment_information_response.dart';
import '../domain.dart';
import '../entities/agency/agency_info.dart';

@injectable
class WalletPointUseCase {
  final WalletPointRepository _walletPointRepository;

  WalletPointUseCase(this._walletPointRepository);

  Future<List<AgencyResponse>> getAllAgency() async {
    return _walletPointRepository.getAllAgency();
  }

  Future<AgencyDetailResponse> getAgencyInfo({required int agencyId}) async {
    return _walletPointRepository.getAgencyInfo(agencyId);
  }

  Future<ExchangeCoinResponse> exchangeCoin(
      {required int agencyId, required BuyCoinRequest request}) async {
    return _walletPointRepository.exchangeCoin(
        agencyId: agencyId, request: request);
  }

  Future<EstCoinResponse> estCoin(
      {required int agencyId, required num vnd, required num coin}) async {
    return _walletPointRepository.estCoin(
        agencyId: agencyId, vnd: vnd, coin: coin);
  }

  Future<WalletCoinPaymentInformation> paymentInformation(
      {required int agencyId,
      required AgencyPaymentInformation request}) async {
    return _walletPointRepository.paymentInformation(agencyId: agencyId, request: request);
  }
}
