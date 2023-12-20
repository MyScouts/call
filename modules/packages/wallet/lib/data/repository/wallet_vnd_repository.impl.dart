import 'dart:io';

import 'package:cross_file/cross_file.dart';
import 'package:injectable/injectable.dart';
import 'package:wallet/data/datasources/models/request/verify_otp_request.dart';
import 'package:wallet/data/datasources/models/response/estimate_tax_response.dart';

import '../../domain/domain.dart';
import '../data.dart';
import '../datasources/models/request/estimate_tax_request.dart';

@Injectable(as: WalletVndRepository)
class WalletVndRepositoryImpl implements WalletVndRepository {
  final VndWalletApi _vndWalletApi;

  WalletVndRepositoryImpl(this._vndWalletApi);

  @override
  Future<VndWalletInfo> getVndWalletInfo() async {
    final response = await _vndWalletApi.getVndWalletInfo();
    return response.data;
  }

  @override
  Future<List<Bank>> getAllBanksInfo() async {
    final response = await _vndWalletApi.getAllBanksInfo();
    return response.data.banks;
  }

  @override
  Future<List<BankAccount>> getBankAccounts() async {
    final response = await _vndWalletApi.getBankAccounts();
    return response.data.banks;
  }

  @override
  Future<Otp> getOtp() async {
    final response = await _vndWalletApi.getOtp();
    return response.data.otp;
  }

  @override
  Future<String> uploadImage(File file) async {
    final result = await _vndWalletApi.uploadImage(file);
    return result.data['filename'];
  }

  @override
  Future<BankAccount> addBankAccount(AddBankAccountRequest request) async {
    final response = await _vndWalletApi.addBankAccount(body: request);
    return response.data;
  }

  @override
  Future<bool> deleteBankAccount({required int bankId}) async {
    final response = await _vndWalletApi.deleteBankAccount(id: bankId);
    return response.data;
  }

  @override
  Future<EstimateTaxResponse> estimateTax(num value) async {
    final request = EstimateTaxRequest(value: value);
    final response = await _vndWalletApi.estimateTax(body: request);
    return response;
  }

  @override
  Future requestWithdrawOtp() async {
    final request = VerifyOtpRequest(type: 'WithdrawMoney');
    final response = await _vndWalletApi.requestOtp(body: request);
    return response;
  }

  @override
  Future<void> withdraw(WithdrawRequest request) async {
    await _vndWalletApi.withdraw(request: request);
  }

  @override
  Future<void> setDefaultBankAccount(
      {required int id, required bool isDefault}) async {
    await _vndWalletApi
        .setDefaultBankAccount(id: id, body: {'isDefault': isDefault});
  }

  @override
  Future<String> storageUploadUrl(XFile xFile, String prefix) async {
    final res = await _vndWalletApi.storageUploadUrl(xFile, prefix);
    return res;
  }
}
