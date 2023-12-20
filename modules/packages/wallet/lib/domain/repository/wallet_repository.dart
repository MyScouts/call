import 'package:wallet/data/datasources/models/request/wallet_transactions_request.dart';
import 'package:wallet/data/datasources/models/response/wallet_info_response.dart';
import 'package:wallet/presentation/shared/model/infomation_pdone_profile.dart';
import 'package:wallet/presentation/wallet_constant.dart';

import '../../data/datasources/models/response/onboarding_response.dart';
import '../../data/datasources/models/response/transactions_response.dart';

abstract class WalletRepository {
  Future<UserWallet?> getWalletInfo();

  Future<List<TransactionItem>> getWalletTransactionList({
    required WalletType walletType,
    required WalletTransactionsRequest request,
  });

  Future<TransactionItem> getTransactionDetails(String id);

  Future<PDoneProfile> getPDoneProfile();

  Future<OnboardingResponse> getOnboarding();
}
