import 'package:app_core/app_core.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wallet/data/datasources/models/est_coin_response.dart';
import 'package:wallet/data/datasources/models/wallet_coin_payment_information_response.dart';

import '../../../core/core.dart';
import '../../../core/networking/api_response.dart';
import '../../../domain/domain.dart';
import '../../../domain/entities/agency/agency_info.dart';
import '../models/exchange_coin_response.dart';
import '../models/models.dart';

part 'point_wallet_api.g.dart';

class PointWalletApiConstants {
  static const transactionList = '/api/point/transaction/list';
  static const transactionDetail = '/api/point/transaction/{id}';
  static const getAllAgency = 'api/v1/coin-agency/list?page=1&pageSize=10';
  static const agencyInfo = 'api/v1/coin-agency/{agencyId}';
  static const exchange = 'api/v1/coin-agency/{agencyId}/buy';
  static const paymentInfo = 'api/v1/coin-agency/{agencyId}/payment-info';
  static const getCoinWalletInfo = '/api/coin-wallet/info';
  static const estCoin = 'api/v1/coin-agency/{agencyId}/price';
}

@RestApi()
@injectable
abstract class PointWalletApi {
  @factoryMethod
  factory PointWalletApi(WalletProvider provider) =>
      _PointWalletApi(provider.dio);

  @POST(PointWalletApiConstants.transactionList)
  Future<ApiResponse<TransactionResponse<PointTransactionHistory>>>
      getTransactionList({
    @Body() required Map<String, dynamic> body,
  });

  @GET(PointWalletApiConstants.transactionDetail)
  Future<ApiResponse<PointTransactionHistoryDetail>> getTransactionDetail({
    @Path('id') required int id,
  });

  @GET(PointWalletApiConstants.getAllAgency)
  Future<ApiResponse<AgencyListResponse>> getAllAgency();

  @GET(PointWalletApiConstants.agencyInfo)
  Future<ApiResponse<AgencyDetailResponse>> getAgencyInfo(
      {@Path('agencyId') required int id});
  //
  // @GET(PointWalletApiConstants.getCoinWalletInfo)
  // Future<ApiResponse<CoinWalletInfo>> getCoinWalletInfo();

  @GET(PointWalletApiConstants.estCoin)
  Future<ApiResponse<EstCoinResponse>> estCoin(
      {@Path('agencyId') required int agencyId,
      @Query('vnd') required num vnd,
      @Query('coin') required num coin});

  @POST(PointWalletApiConstants.exchange)
  Future<ApiResponse<ExchangeCoinResponse>> exchangeCoin(
      {@Path('agencyId') required int agencyId,
      @Body() required Map<String, dynamic> body});

  @POST(PointWalletApiConstants.paymentInfo)
  Future<ApiResponse<WalletCoinPaymentInformation>> paymentInformation(
      {@Path('agencyId') required int agencyId,
      @Body() required Map<String, dynamic> body});
}
