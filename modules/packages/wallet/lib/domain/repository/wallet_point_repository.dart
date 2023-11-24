import 'package:wallet/data/datasources/models/est_coin_response.dart';

import '../entities/agency/agency_info.dart';
import '../entities/entities.dart';

abstract class WalletPointRepository {
  Future<List<PointTransactionHistory>> getTransactionHistories(
      Map<String, dynamic> body);

  Future<PointTransactionHistoryDetail> getTransactionHistoryDetail(int id);

  Future<List<AgencyResponse>> getAllAgency();

  Future<AgencyResponse> getAgencyInfo(int id);

  Future<CoinWalletInfo> getCoinWalletInfo();

  Future<EstCoinResponse> estCoin(
      {required int agencyId, required num vnd, required num coin});

  Future<EstCoinResponse> exchangeCoin(
      {required int agencyId, required num vnd, required num coin});
}
