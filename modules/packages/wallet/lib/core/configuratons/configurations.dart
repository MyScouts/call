import 'package:app_core/app_core.dart';

import '../../data/datasources/models/response/wallet_info_response.dart';
import '../../domain/domain.dart' hide User;

class WalletConfigurations {
  final String baseUrl;
  final bool isStudio;

  WalletConfigurations(this.baseUrl, this.isStudio);
}

class WalletInjectedData {
  static User user = const User();

  static set setUser(User value) => user = value;

  static UserWallet userWallet = UserWallet();

  static set setUserWallet(UserWallet value) => userWallet = value;

  static VndWalletInfo vndWalletInfo = const VndWalletInfo();

  static set setVndWalletInfo(VndWalletInfo value) => vndWalletInfo = value;

  static DiamondWalletInfo diamondWalletInfo = const DiamondWalletInfo();

  static set setDiamondWalletInfo(DiamondWalletInfo value) =>
      diamondWalletInfo = value;
}
