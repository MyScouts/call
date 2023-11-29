import 'package:app_core/app_core.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wallet/data/datasources/models/response/wallet_info_response.dart';

import '../../../core/core.dart';
import '../models/response/transactions_response.dart';

part 'wallet_api.g.dart';

class WalletApiConstants {
  static const transactionList = '/api/v1/transaction/list';
  static const walletInfo = '/api/v1/wallet';
  static const transactionDetail = '/api/v1/transaction/{id}';
  static const transactionsVNDWallet = '/api/v1/transaction/vnd/list';
  static const transactionsDiamondWallet = '/api/v1/transaction/diamond/list';
  static const transactionsCoinWallet = '/api/v1/transaction/coin/list';
}

@RestApi()
@injectable
abstract class WalletApi {
  @factoryMethod
  factory WalletApi(WalletProvider provider) => _WalletApi(provider.dio);

  @GET(WalletApiConstants.walletInfo)
  Future<WalletInfoResponse> getWalletInfo();

  // @GET(WalletApiConstants.transactionList)
  // Future<TransactionsResponse> getWalletTransactionList();

  @GET(WalletApiConstants.transactionsVNDWallet)
  Future<TransactionsResponse> getTransactionsVNDWallet();

  @GET(WalletApiConstants.transactionsDiamondWallet)
  Future<TransactionsResponse> getTransactionsDiamondWallet();

  @GET(WalletApiConstants.transactionsCoinWallet)
  Future<TransactionsResponse> getTransactionsCoinWallet();

// @GET(PointWalletApiConstants.transactionDetail)
// Future<ApiResponse<PointTransactionHistoryDetail>> getTransactionDetail({
//   @Path('id') required int id,
// });
}
