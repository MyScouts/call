import '../entities/entities.dart';
import '../../data/datasources/models/exchange_diamond_response.dart';

abstract class WalletDiamondRepository {

  Future<DiamondWalletInfo> getWalletInfo();

  Future<ExchangeDiamondResponse> exchangeDiamond(Map<String, dynamic> body);

  Future<int> estimateDiamond(int value);
}
