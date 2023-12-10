import 'package:app_core/app_core.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wallet/data/datasources/models/response/transaction_details_response.dart';
import 'package:wallet/data/datasources/models/response/wallet_info_response.dart';

import '../../../core/core.dart';
import '../models/response/pdone_profile_response.dart';
import '../models/response/transactions_response.dart';

part 'wallet_api.g.dart';

class WalletApiConstants {
  static const transactionList = '/api/v1/transaction/list';
  static const walletInfo = '/api/v1/wallet';
  static const transactionDetail = '/api/v1/transaction/{id}';
  static const transactionsVNDWallet = '/api/v1/transaction/vnd/list';
  static const transactionsDiamondWallet = '/api/v1/transaction/diamond/list';
  static const transactionsCoinWallet = '/api/v1/transaction/coin/list';
  static const pDoneProfile = '/api/v1/p-done/profile';
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
  Future<TransactionsResponse> getTransactionsVNDWallet({
    @Query('page') int? page,
    @Query('pageSize') int? pageSize,
    @Query('category') String? category,
    @Query('fromTimestamp') num? fromTimestamp,
    @Query('toTimestamp') num? toTimestamp,
  });

  @GET(WalletApiConstants.transactionsDiamondWallet)
  Future<TransactionsResponse> getTransactionsDiamondWallet({
    @Query('page') int? page,
    @Query('pageSize') int? pageSize,
    @Query('category') String? category,
    @Query('fromTimestamp') num? fromTimestamp,
    @Query('toTimestamp') num? toTimestamp,
  });

  @GET(WalletApiConstants.transactionsCoinWallet)
  Future<TransactionsResponse> getTransactionsCoinWallet({
    @Query('page') int? page,
    @Query('pageSize') int? pageSize,
    @Query('category') String? category,
    @Query('fromTimestamp') num? fromTimestamp,
    @Query('toTimestamp') num? toTimestamp,
  });

  @GET(WalletApiConstants.transactionDetail)
  Future<TransactionDetailsResponse> getTransactionDetail({
    @Path('id') required String id,
  });

  @GET(WalletApiConstants.pDoneProfile)
  Future<PDoneProfileResponse> getPDoneProfile();
}
