import '../entities/entities.dart';

abstract class WalletDiamondRepository {
  Future<List<DiamondTransactionHistory>> getTransactionHistories(
      Map<String, dynamic> body);

  Future<DiamondTransactionHistoryDetail> getTransactionHistoryDetail(int id);

  Future<DiamondWalletInfo> getWalletInfo();

  Future<DiamondTransactionHistory> exchangeDiamond(Map<String, dynamic> body);

  Future<int> estimateDiamond(int value);
}
