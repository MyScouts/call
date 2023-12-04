import 'dart:io';

import 'package:injectable/injectable.dart';

import '../../domain/domain.dart';
import '../data.dart';

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
  Future<num> estimateTax(num value) async {
    final response = await _vndWalletApi.estimateTax(val: value);
    return response.data;
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
}
