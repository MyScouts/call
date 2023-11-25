import 'package:wallet/data/datasources/models/est_coin_response.dart';
import 'package:wallet/data/datasources/models/request/agency_get_payment_information_request.dart';
import 'package:wallet/data/datasources/models/wallet_coin_payment_information_response.dart';

import '../../data/datasources/models/exchange_coin_response.dart';
import '../../data/datasources/models/request/buy_coin_request.dart';
import '../entities/agency/agency_info.dart';
import '../entities/entities.dart';

abstract class WalletPointRepository {
  Future<List<PointTransactionHistory>> getTransactionHistories(
      Map<String, dynamic> body);

  Future<PointTransactionHistoryDetail> getTransactionHistoryDetail(int id);

  Future<List<AgencyResponse>> getAllAgency();

  Future<AgencyDetailResponse> getAgencyInfo(int id);

  // Future<CoinWalletInfo> getCoinWalletInfo();

  Future<EstCoinResponse> estCoin(
      {required int agencyId, required num vnd, required num coin});

  Future<ExchangeCoinResponse> exchangeCoin(
      {required int agencyId, required BuyCoinRequest request});

  Future<WalletCoinPaymentInformation> paymentInformation(
      {required int agencyId, required AgencyPaymentInformation request});
}
