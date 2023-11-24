import 'package:app_core/app_core.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wallet/data/datasources/models/est_coin_response.dart';

import '../../../core/core.dart';
import '../../../core/networking/api_response.dart';
import '../../../domain/domain.dart';
import '../../../domain/entities/agency/agency_info.dart';
import '../models/models.dart';

part 'point_wallet_api.g.dart';

class PointWalletApiConstants {
  static const transactionList = '/api/point/transaction/list';
  static const transactionDetail = '/api/point/transaction/{id}';
  static const getAllAgency = 'api/v1/coin-agency/list?page=1&pageSize=10';
  static const agencyInfo = 'api/v1/coin-agency/{agencyId}';
  static const exchange = '/api/point/agency/{agencyId}/exchange';
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
  Future<ApiResponse<AgencyResponse>> getAgencyInfo(
      {@Path('agencyId') required int id});

  @GET(PointWalletApiConstants.exchange)
  Future<ApiResponse<num>> exchange(
      {@Path('agencyId') required int agencyId,
      @Query('value') required num val});

  @GET(PointWalletApiConstants.getCoinWalletInfo)
  Future<ApiResponse<CoinWalletInfo>> getCoinWalletInfo();

  @GET(PointWalletApiConstants.estCoin)
  Future<ApiResponse<EstCoinResponse>> estCoin(
      {@Path('agencyId') required int agencyId,
      @Query('vnd') required num vnd,
      @Query('coin') required num coin});

  @POST(PointWalletApiConstants.estCoin)
  Future<ApiResponse<EstCoinResponse>> exchangeCoin(
      {@Path('agencyId') required int agencyId,
        @Query('vnd') required num vnd,
        @Query('coin') required num coin});
}
