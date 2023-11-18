import 'package:injectable/injectable.dart';

import '../../domain/domain.dart';
import '../../domain/entities/agency/agency_info.dart';
import '../datasources/remote/remote.dart';

@Injectable(as: WalletPointRepository)
class WalletPointRepositoryImpl implements WalletPointRepository {
  final PointWalletApi _pointWalletApi;

  WalletPointRepositoryImpl(this._pointWalletApi);

  @override
  Future<List<PointTransactionHistory>> getTransactionHistories(
      Map<String, dynamic> body) async {
    final response = await _pointWalletApi.getTransactionList(
      body: body,
    );

    return response.data.transactions;
  }

  @override
  Future<PointTransactionHistoryDetail> getTransactionHistoryDetail(
      int id) async {
    final response = await _pointWalletApi.getTransactionDetail(id: id);

    return response.data;
  }

  @override
  Future<List<Agency>> getAllAgency() async {
    final response = await _pointWalletApi.getAllAgency();
    return response.data.agencies;
  }

  @override
  Future<AgencyInfo> getAgencyInfo(int id) async {
    final response = await _pointWalletApi.getAgencyInfo(id: id);
    return response.data;
  }

  @override
  Future<num> exchangeCoin({required int agencyId, required num value}) async {
    final response = await _pointWalletApi.exchange(
      agencyId: agencyId,
      val: value,
    );

    return response.data;
  }

  @override
  Future<CoinWalletInfo> getCoinWalletInfo() async {
    final response = await _pointWalletApi.getCoinWalletInfo();
    return response.data;
  }
}
