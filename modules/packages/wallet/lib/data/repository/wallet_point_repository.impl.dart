import 'package:injectable/injectable.dart';
import 'package:wallet/data/datasources/models/est_coin_response.dart';
import 'package:wallet/data/datasources/models/request/agency_get_payment_information_request.dart';
import 'package:wallet/data/datasources/models/request/buy_coin_request.dart';
import 'package:wallet/data/datasources/models/wallet_coin_payment_information_response.dart';

import '../../domain/domain.dart';
import '../../domain/entities/agency/agency_info.dart';
import '../datasources/models/exchange_coin_response.dart';
import '../datasources/remote/remote.dart';

@Injectable(as: WalletPointRepository)
class WalletPointRepositoryImpl implements WalletPointRepository {
  final PointWalletApi _pointWalletApi;

  WalletPointRepositoryImpl(this._pointWalletApi);

  @override
  Future<List<PointTransactionHistory>> getTransactionHistories(
      Map<String, dynamic> body) async {
    final response = await _pointWalletApi.getTransactionList(
      body: body,
    );

    return response.data.transactions;
  }

  @override
  Future<PointTransactionHistoryDetail> getTransactionHistoryDetail(
      int id) async {
    final response = await _pointWalletApi.getTransactionDetail(id: id);

    return response.data;
  }

  @override
  Future<List<AgencyResponse>> getAllAgency() async {
    final response = await _pointWalletApi.getAllAgency();
    return response.data.coinAgencies;
  }

  @override
  Future<AgencyDetailResponse> getAgencyInfo(int id) async {
    final response = await _pointWalletApi.getAgencyInfo(id: id);
    return response.data;
  }

  @override
  Future<CoinWalletInfo> getCoinWalletInfo() async {
    final response = await _pointWalletApi.getCoinWalletInfo();
    return response.data;
  }

  @override
  Future<EstCoinResponse> estCoin(
      {required int agencyId, required num vnd, required num coin}) async {
    // TODO: implement estCoin
    final response =
        await _pointWalletApi.estCoin(agencyId: agencyId, vnd: vnd, coin: coin);
    return response.data;
  }

  @override
  Future<ExchangeCoinResponse> exchangeCoin(
      {required int agencyId, required BuyCoinRequest request}) async {
    // TODO: implement exchangeCoin
    final response = await _pointWalletApi.exchangeCoin(
        agencyId: agencyId, body: request.toJson());
    return response.data;
  }

  @override
  Future<WalletCoinPaymentInformation> paymentInformation(
      {required int agencyId, required AgencyPaymentInformation request}) async{
    // TODO: implement paymentInformation
    final response = await _pointWalletApi.paymentInformation(
        agencyId: agencyId, body: request.toJson());
    return response.data;
  }
}
