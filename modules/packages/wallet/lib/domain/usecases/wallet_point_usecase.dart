import 'package:injectable/injectable.dart';

import '../../data/datasources/models/est_coin_response.dart';
import '../domain.dart';
import '../entities/agency/agency_info.dart';

@injectable
class WalletPointUseCase {
  final WalletPointRepository _walletPointRepository;

  WalletPointUseCase(this._walletPointRepository);

  Future<List<PointTransactionHistory>> getTransactionHistories(
    PointTransactionHistoryFilter filter,
    Pagination paginate,
  ) async {
    final body = {
      ...paginate.toJson(),
      ...filter.toJson(),
    };

    return _walletPointRepository.getTransactionHistories(body);
  }

  Future<PointTransactionHistoryDetail> getTransactionHistoryDetail(
      int id) async {
    return _walletPointRepository.getTransactionHistoryDetail(id);
  }

  Future<List<Agency>> getAllAgency() async {
    return _walletPointRepository.getAllAgency();
  }

  Future<AgencyInfo> getAgencyInfo({required int agencyId}) async {
    return _walletPointRepository.getAgencyInfo(agencyId);
  }

  Future<num> exchangeCoin({required int agencyId, required num value}) async {
    return _walletPointRepository.exchangeCoin(
      agencyId: agencyId,
      value: value,
    );
  }

  Future<EstCoinResponse> estCoint(
      {required int agencyId, required num vnd, required num coin}) async {
    return _walletPointRepository.estCoin(
        agencyId: agencyId, vnd: vnd, coin: coin);
  }
}
