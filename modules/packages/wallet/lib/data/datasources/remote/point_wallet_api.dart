import 'package:app_core/app_core.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/core.dart';
import '../../../core/networking/api_response.dart';
import '../../../domain/domain.dart';
import '../../../domain/entities/agency/agency_info.dart';
import '../models/agency_response.dart';
import '../models/models.dart';

part 'point_wallet_api.g.dart';

class PointWalletApiConstants {
  static const transactionList = '/api/point/transaction/list';
  static const transactionDetail = '/api/point/transaction/{id}';
  static const getAllAgency = '/api/point/all-agency';
  static const agencyInfo = '/api/point/agency/{agencyId}/detail';
  static const exchange = '/api/point/agency/{agencyId}/exchange';
  static const getCoinWalletInfo = '/api/coin-wallet/info';
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
  Future<ApiResponse<AgencyResponse>> getAllAgency();

  @GET(PointWalletApiConstants.agencyInfo)
  Future<ApiResponse<AgencyInfo>> getAgencyInfo(
      {@Path('agencyId') required int id});

  @GET(PointWalletApiConstants.exchange)
  Future<ApiResponse<num>> exchange(
      {@Path('agencyId') required int agencyId,
      @Query('value') required num val});

  @GET(PointWalletApiConstants.getCoinWalletInfo)
  Future<ApiResponse<CoinWalletInfo>> getCoinWalletInfo();
}
