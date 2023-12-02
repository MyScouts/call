import 'package:app_core/app_core.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wallet/data/datasources/models/response/wallet_info_response.dart';

import '../../../core/core.dart';
import '../../../core/networking/api_response.dart';
import '../../../domain/domain.dart';
import '../models/exchange_diamond_response.dart';

part 'diamond_wallet_api.g.dart';

class DiamondWalletApiConstants {
  static const getDiamondWalletInfo = 'api/v1/wallet';
  static const exchangeDiamond = 'api/v1/wallet/exchange/diamond-to-vnd';
  static const estimateDiamond = '/api/diamond-wallet/exchange-vnd/estimate';
}

@RestApi()
@injectable
abstract class DiamondWalletApi {
  @factoryMethod
  factory DiamondWalletApi(WalletProvider provider) =>
      _DiamondWalletApi(provider.dio);

  @GET(DiamondWalletApiConstants.getDiamondWalletInfo)
  Future<ApiResponse<WalletInfoResponse>> getDiamondWalletInfo();

  @POST(DiamondWalletApiConstants.exchangeDiamond)
  Future<ApiResponse<ExchangeDiamondResponse>> exchangeDiamond({
    @Body() required Map<String, dynamic> body,
  });

  @GET(DiamondWalletApiConstants.estimateDiamond)
  Future<ApiResponse<int>> estimateDiamond({
    @Query('value') required int data,
  });
}
