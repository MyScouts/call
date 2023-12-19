import 'dart:io';
import 'dart:typed_data';

import 'package:app_core/app_core.dart';
import 'package:cross_file/cross_file.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wallet/data/datasources/models/request/estimate_tax_request.dart';

import '../../../core/core.dart';
import '../../../core/networking/api_response.dart';
import '../../../domain/domain.dart';
import '../models/models.dart';
import '../models/request/verify_otp_request.dart';
import '../models/response/estimate_tax_response.dart';
import '../models/response/storage_upload_url_response.dart';

part 'vnd_wallet_api.g.dart';

class VndWalletApiConstants {
  static const vndWalletInfo = '/api/vnd-wallet/info';
  static const getAllBanksInfo = '/api/bank-account/banks-info';
  static const getBankAccounts = '/api/bank-account';
  static const uploadImage = '/api/upload/image';
  static const getOtp = '/api/sms/send-otp';
  static const addBankAccount = '/api/bank-account';
  static const deleteBankAccount = '/api/bank-account/{id}';
  static const estimateTax = 'api/v1/wallet/withdraw-vnd/estimate';
  static const requestOtp = 'api/v1/auth/otp';
  static const withdraw = 'api/v1/wallet/withdraw-vnd';
  static const setDefaultBankAccount = '/api/bank-account/{id}/default';
}

@RestApi()
@injectable
abstract class VndWalletApi {
  @factoryMethod
  factory VndWalletApi(WalletProvider provider) => _VndWalletApi(provider.dio);

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

  @POST(VndWalletApiConstants.addBankAccount)
  Future<ApiResponse<BankAccount>> addBankAccount({
    @Body() required AddBankAccountRequest body,
  });

  @DELETE(VndWalletApiConstants.deleteBankAccount)
  Future<ApiResponse<bool>> deleteBankAccount({@Path('id') required int id});

  @POST(VndWalletApiConstants.estimateTax)
  Future<EstimateTaxResponse> estimateTax(
      {@Body() required EstimateTaxRequest body});

  @POST(VndWalletApiConstants.requestOtp)
  Future requestOtp({
    @Body() required VerifyOtpRequest body,
  });

  @POST(VndWalletApiConstants.withdraw)
  Future<void> withdraw({@Body() required WithdrawRequest request});

  @POST(VndWalletApiConstants.setDefaultBankAccount)
  Future<void> setDefaultBankAccount(
      {@Path('id') required int id,
      @Body() required Map<String, dynamic> body});

  Future<String> storageUploadUrl(XFile file, String prefix);

}
