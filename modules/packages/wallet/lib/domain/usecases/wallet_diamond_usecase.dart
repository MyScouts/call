import 'package:injectable/injectable.dart';

import '../../data/datasources/models/response/wallet_info_response.dart';
import '../entities/wallet/diamond_wallet/diamond_wallet_info.dart';
import '../../data/datasources/models/exchange_diamond_response.dart';
import '../repository/wallet_diamond_repository.dart';
import '../specs/filters/diamond_transaction_history.dart';
import '../specs/pagination/pagination.dart';

@injectable
class WalletDiamondUseCase {
  final WalletDiamondRepository _walletDiamondRepository;

  WalletDiamondUseCase(this._walletDiamondRepository);

  // Future<List<DiamondTransactionHistory>> getTransactionHistories(
  //   DiamondTransactionHistoryFilter filter,
  //   Pagination paginate,
  // ) async {
  //   final body = {
  //     ...paginate.toJson(),
  //     ...filter.toJson(),
  //   };
  //
  //   return _walletDiamondRepository.getTransactionHistories(body);
  // }

  Future<WalletInfoResponse> getWalletInfo() =>
      _walletDiamondRepository.getWalletInfo();

  Future<ExchangeDiamondResponse> exchangeDiamond(
          Map<String, dynamic> body) =>
      _walletDiamondRepository.exchangeDiamond(body);

  Future<int> estimateDiamond(int value) async {
    return _walletDiamondRepository.estimateDiamond(value);
  }
}
