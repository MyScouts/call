import 'package:injectable/injectable.dart';
import 'package:wallet/data/datasources/models/est_coin_response.dart';

import '../../../wallet.dart';
// import '../entities/wallet/coin_wallet_info/coin_wallet_info.dart';
import '../../data/datasources/models/response/wallet_info_response.dart';
import '../entities/wallet/diamond_wallet/diamond_wallet_info.dart';
import '../entities/wallet/vnd_wallet_info/vnd_wallet_info.dart';
import '../repository/wallet_diamond_repository.dart';
import '../repository/wallet_point_repository.dart';
import '../repository/wallet_vnd_repository.dart';

@injectable
class WalletUseCase {
  final WalletVndRepository _walletVndRepository;
  final WalletDiamondRepository _walletDiamondRepository;
  final WalletPointRepository _walletPointRepository;

  WalletUseCase(this._walletVndRepository, this._walletDiamondRepository,
      this._walletPointRepository);

  Future<VndWalletInfo> getVndWalletInfo() async {
    return _walletVndRepository.getVndWalletInfo();
  }

  Future<WalletInfoResponse> getDiamondWalletInfo() async {
    return _walletDiamondRepository.getWalletInfo();
  }
  //
  // Future<CoinWalletInfo> getCoinWalletInfo() async {
  //   return _walletPointRepository.getCoinWalletInfo();
  // }

  Future<EstCoinResponse> estCoin(
      {required int agencyId, required num vnd, required num coin}) async {
    return _walletPointRepository.estCoin(
        agencyId: agencyId, vnd: vnd, coin: coin);
  }
}
