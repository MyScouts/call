import 'package:injectable/injectable.dart';
import 'package:wallet/data/datasources/models/request/wallet_transactions_request.dart';
import 'package:wallet/data/datasources/models/response/transaction_details_response.dart';
import 'package:wallet/data/datasources/models/response/transactions_response.dart';
import 'package:wallet/data/datasources/models/response/wallet_info_response.dart';
import 'package:wallet/presentation/wallet_constant.dart';

import '../../domain/repository/wallet_repository.dart';
import '../datasources/remote/wallet_api.dart';

@Injectable(as: WalletRepository)
class WalletRepositoryImpl implements WalletRepository {
  final WalletApi _walletApi;

  WalletRepositoryImpl(this._walletApi);

  @override
  Future<UserWallet?> getWalletInfo() async {
    final response = await _walletApi.getWalletInfo();
    return response.userWallet;
  }

  @override
  Future<List<TransactionItem>> getWalletTransactionList(
      {required WalletType walletType,
      WalletTransactionsRequest? request}) async {
    TransactionsResponse? response;

    if (walletType == WalletType.coin) {
      response = await _walletApi.getTransactionsCoinWallet(
        pageSize: request?.pageSize ?? 100,
        page: request?.page,
        category: request?.category,
        fromTimestamp: request?.fromTimestamp,
        toTimestamp: request?.toTimestamp,
      );
    } else if (walletType == WalletType.diamond) {
      response = await _walletApi.getTransactionsDiamondWallet(
        pageSize: request?.pageSize ?? 100,
        page: request?.page,
        category: request?.category,
        fromTimestamp: request?.fromTimestamp,
        toTimestamp: request?.toTimestamp,
      );
    } else if (walletType == WalletType.vnd) {
      response = await _walletApi.getTransactionsVNDWallet(
        pageSize: request?.pageSize ?? 100,
        page: request?.page,
        category: request?.category,
        fromTimestamp: request?.fromTimestamp,
        toTimestamp: request?.toTimestamp,
      );
    }
    return response?.transactions ?? [];
  }

  @override
  Future<TransactionItem> getTransactionDetails(String id) async {
    final response = await _walletApi.getTransactionDetail(id: id);
    return response.transaction ?? TransactionItem();
  }
}
