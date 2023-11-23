import '../entities/agency/agency_info.dart';
import '../entities/entities.dart';

abstract class WalletPointRepository {
  Future<List<PointTransactionHistory>> getTransactionHistories(
      Map<String, dynamic> body);

  Future<PointTransactionHistoryDetail> getTransactionHistoryDetail(int id);

  Future<List<Agency>> getAllAgency();

  Future<AgencyInfo> getAgencyInfo(int id);

  Future<num> exchangeCoin({required int agencyId, required num value});
}
