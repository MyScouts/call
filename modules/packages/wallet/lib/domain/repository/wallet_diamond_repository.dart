import '../entities/entities.dart';
import '../entities/wallet/diamond_wallet/exchange_diamond_response.dart';

abstract class WalletDiamondRepository {
  Future<List<DiamondTransactionHistory>> getTransactionHistories(
      Map<String, dynamic> body);

  Future<DiamondTransactionHistoryDetail> getTransactionHistoryDetail(int id);

  Future<DiamondWalletInfo> getWalletInfo();

  Future<ExchangeDiamondResponse> exchangeDiamond(Map<String, dynamic> body);

  Future<int> estimateDiamond(int value);
}
