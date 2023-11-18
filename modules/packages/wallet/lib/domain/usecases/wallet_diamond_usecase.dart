import 'package:injectable/injectable.dart';

import '../../../wallet.dart';
import '../entities/diamond_transaction_history/diamond_transaction_history.dart';
import '../entities/diamond_transaction_history/diamond_transaction_history_detail.dart';
import '../entities/wallet/diamond_wallet/diamond_wallet_info.dart';
import '../repository/wallet_diamond_repository.dart';
import '../specs/filters/diamond_transaction_history.dart';
import '../specs/pagination/pagination.dart';

@injectable
class WalletDiamondUseCase {
  final WalletDiamondRepository _walletDiamondRepository;

  WalletDiamondUseCase(this._walletDiamondRepository);

  Future<List<DiamondTransactionHistory>> getTransactionHistories(
    DiamondTransactionHistoryFilter filter,
    Pagination paginate,
  ) async {
    final body = {
      ...paginate.toJson(),
      ...filter.toJson(),
    };

    return _walletDiamondRepository.getTransactionHistories(body);
  }

  Future<DiamondTransactionHistoryDetail> getTransactionHistoryDetail(
      int id) async {
    return _walletDiamondRepository.getTransactionHistoryDetail(id);
  }

  Future<DiamondWalletInfo> getWalletInfo() =>
      _walletDiamondRepository.getWalletInfo();

  Future<DiamondTransactionHistory> exchangeDiamond(
          Map<String, dynamic> body) =>
      _walletDiamondRepository.exchangeDiamond(body);

  Future<int> estimateDiamond(int value) async {
    return _walletDiamondRepository.estimateDiamond(value);
  }
}
