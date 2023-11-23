import 'package:injectable/injectable.dart';

import '../../domain/domain.dart';
import '../datasources/models/exchange_diamond_response.dart';
import '../datasources/remote/remote.dart';

@Injectable(as: WalletDiamondRepository)
class WalletDiamondRepositoryImpl implements WalletDiamondRepository {
  final DiamondWalletApi _diamondWalletApi;

  WalletDiamondRepositoryImpl(this._diamondWalletApi);

  @override
  Future<List<DiamondTransactionHistory>> getTransactionHistories(
      Map<String, dynamic> body) async {
    final response = await _diamondWalletApi.getTransactionList(body: body);

    return response.data.transactions;
  }

  @override
  Future<DiamondTransactionHistoryDetail> getTransactionHistoryDetail(
      int id) async {
    final response = await _diamondWalletApi.getTransactionDetail(id: id);

    return response.data;
  }

  @override
  Future<DiamondWalletInfo> getWalletInfo() async {
    final response = await _diamondWalletApi.getDiamondWalletInfo();

    return response.data;
  }

  @override
  Future<ExchangeDiamondResponse> exchangeDiamond(
      Map<String, dynamic> body) async {
    final response = await _diamondWalletApi.exchangeDiamond(body: body);

    return response.data;
  }

  @override
  Future<int> estimateDiamond(int value) async {
    final response = await _diamondWalletApi.estimateDiamond(data: value);

    return response.data;
  }
}
