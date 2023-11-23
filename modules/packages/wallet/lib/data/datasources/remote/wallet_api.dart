import 'package:app_core/app_core.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wallet/data/datasources/models/response/wallet_info_response.dart';

import '../../../core/core.dart';

part 'wallet_api.g.dart';

class WalletApiConstants {
  static const transactionList = '/api/v1/transaction/list';
  static const walletInfo = '/api/v1/wallet';
}

@RestApi()
@injectable
abstract class WalletApi {
  @factoryMethod
  factory WalletApi(WalletProvider provider) =>
      _WalletApi(provider.dio);

  @GET(WalletApiConstants.walletInfo)
  Future<WalletInfoResponse> getWalletInfo();
}
