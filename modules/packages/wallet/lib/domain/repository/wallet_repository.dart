import 'package:wallet/data/datasources/models/wallet_info_response.dart';

abstract class WalletRepository {
  Future<UserWallet?> getWalletInfo();
}
