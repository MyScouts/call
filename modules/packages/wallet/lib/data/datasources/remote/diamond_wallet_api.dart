import 'package:app_core/app_core.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/core.dart';
import '../../../core/networking/api_response.dart';
import '../../../domain/domain.dart';
import '../models/models.dart';

part 'diamond_wallet_api.g.dart';

class DiamondWalletApiConstants {
  static const transactionList = '/api/diamond-wallet/transaction/list';
  static const transactionDetail = '/api/diamond-wallet/transaction/{id}';
  static const getDiamondWalletInfo = '/api/diamond-wallet/info';
  static const exchangeDiamond = '/api/diamond-wallet/exchange-vnd';
  static const estimateDiamond = '/api/diamond-wallet/exchange-vnd/estimate';
}

@RestApi()
@injectable
abstract class DiamondWalletApi {
  @factoryMethod
  factory DiamondWalletApi(WalletProvider provider) =>
      _DiamondWalletApi(provider.dio);

  @POST(DiamondWalletApiConstants.transactionList)
  Future<ApiResponse<TransactionResponse<DiamondTransactionHistory>>>
      getTransactionList({
    @Body() required Map<String, dynamic> body,
  });

  @GET(DiamondWalletApiConstants.transactionDetail)
  Future<ApiResponse<DiamondTransactionHistoryDetail>> getTransactionDetail({
    @Path('id') required int id,
  });

  @GET(DiamondWalletApiConstants.getDiamondWalletInfo)
  Future<ApiResponse<DiamondWalletInfo>> getDiamondWalletInfo();

  @POST(DiamondWalletApiConstants.exchangeDiamond)
  Future<ApiResponse<DiamondTransactionHistory>> exchangeDiamond({
    @Body() required Map<String, dynamic> body,
  });

  @GET(DiamondWalletApiConstants.estimateDiamond)
  Future<ApiResponse<int>> estimateDiamond({
    @Query('value') required int data,
  });
}
