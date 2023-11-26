import 'package:wallet/data/datasources/models/est_coin_response.dart';

import '../entities/agency/agency_info.dart';
import '../entities/entities.dart';

abstract class WalletPointRepository {
  Future<List<PointTransactionHistory>> getTransactionHistories(
      Map<String, dynamic> body);

  Future<PointTransactionHistoryDetail> getTransactionHistoryDetail(int id);

  Future<List<Agency>> getAllAgency();

  Future<AgencyInfo> getAgencyInfo(int id);

  Future<num> exchangeCoin({required int agencyId, required num value});

  Future<CoinWalletInfo> getCoinWalletInfo();

  Future<EstCoinResponse> estCoin(
      {required int agencyId, required num vnd, required num coin});
}
