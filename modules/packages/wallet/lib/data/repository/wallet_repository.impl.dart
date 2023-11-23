import 'package:injectable/injectable.dart';
import 'package:wallet/data/datasources/models/response/wallet_info_response.dart';

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
}
