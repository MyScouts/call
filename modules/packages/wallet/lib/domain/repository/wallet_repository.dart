import 'package:wallet/data/datasources/models/response/wallet_info_response.dart';
import 'package:wallet/presentation/wallet_constant.dart';

import '../../data/datasources/models/response/transactions_response.dart';

abstract class WalletRepository {
  Future<UserWallet?> getWalletInfo();

  Future<List<TransactionItem>> getWalletTransactionList({
    required WalletType walletType,
  });
}
