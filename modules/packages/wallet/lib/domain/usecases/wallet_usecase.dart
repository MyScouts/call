import 'package:injectable/injectable.dart';

import '../../../wallet.dart';
import '../entities/wallet/coin_wallet_info/coin_wallet_info.dart';
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

  Future<DiamondWalletInfo> getDiamondWalletInfo() async {
    return _walletDiamondRepository.getWalletInfo();
  }

  Future<CoinWalletInfo> getCoinWalletInfo() async {
    return _walletPointRepository.getCoinWalletInfo();
  }
}
