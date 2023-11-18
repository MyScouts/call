import 'dart:io';

import 'package:app_core/app_core.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/core.dart';
import '../../../core/networking/api_response.dart';
import '../../../domain/domain.dart';
import '../models/models.dart';

part 'vnd_wallet_api.g.dart';

class VndWalletApiConstants {
  static const transactionList = 'api/vnd-wallet/transaction/list';
  static const transactionDetail = '/api/vnd-wallet/transaction/{id}';
  static const vndWalletInfo = '/api/vnd-wallet/info';
  static const getAllBanksInfo = '/api/bank-account/banks-info';
  static const getBankAccounts = '/api/bank-account';
  static const uploadImage = '/api/upload/image';
  static const getOtp = '/api/sms/send-otp';
  static const addBankAccount = '/api/bank-account';
  static const deleteBankAccount = '/api/bank-account/{id}';
  static const estimateTax = '/api/vnd-wallet/withdraw/est-tax';
  static const withdraw = '/api/vnd-wallet/withdraw';
  static const setDefaultBankAccount = '/api/bank-account/{id}/default';
}

@RestApi()
@injectable
abstract class VndWalletApi {
  @factoryMethod
  factory VndWalletApi(WalletProvider provider) => _VndWalletApi(provider.dio);

  @POST(VndWalletApiConstants.transactionList)
  Future<ApiResponse<TransactionResponse<TransactionHistory>>>
      getTransactionList({
    @Body() required Map<String, dynamic> body,
  });

  @GET(VndWalletApiConstants.vndWalletInfo)
  Future<ApiResponse<VndWalletInfo>> getVndWalletInfo();

  @GET(VndWalletApiConstants.getAllBanksInfo)
  Future<ApiResponse<BankResponse>> getAllBanksInfo();

  @GET(VndWalletApiConstants.getBankAccounts)
  Future<ApiResponse<BankAccountResponse>> getBankAccounts();

  @GET(VndWalletApiConstants.getOtp)
  Future<ApiResponse<OtpResponse>> getOtp();

  @POST(VndWalletApiConstants.uploadImage)
  @MultiPart()
  Future<ApiResponse<dynamic>> uploadImage(@Part(name: 'file') File file);

  @GET(VndWalletApiConstants.transactionDetail)
  Future<ApiResponse<TransactionHistoryDetail>> getTransactionDetail({
    @Path('id') required int id,
  });

  @POST(VndWalletApiConstants.addBankAccount)
  Future<ApiResponse<BankAccount>> addBankAccount({
    @Body() required AddBankAccountRequest body,
  });

  @DELETE(VndWalletApiConstants.deleteBankAccount)
  Future<ApiResponse<bool>> deleteBankAccount({@Path('id') required int id});

  @POST(VndWalletApiConstants.estimateTax)
  Future<ApiResponse<num>> estimateTax({@Query('value') required num val});

  @POST(VndWalletApiConstants.withdraw)
  Future<void> withdraw({@Body() required WithdrawRequest request});

  @POST(VndWalletApiConstants.setDefaultBankAccount)
  Future<void> setDefaultBankAccount(
      {@Path('id') required int id,
      @Body() required Map<String, dynamic> body});
}
