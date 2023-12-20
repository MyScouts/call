import 'dart:io';
import 'package:cross_file/cross_file.dart';

import '../../data/data.dart';
import '../../data/datasources/models/response/estimate_tax_response.dart';
import '../entities/entities.dart';

abstract class WalletVndRepository {
  Future<VndWalletInfo> getVndWalletInfo();

  Future<List<Bank>> getAllBanksInfo();

  Future<List<BankAccount>> getBankAccounts();

  Future<Otp> getOtp();

  Future<String> uploadImage(File file);

  Future<BankAccount> addBankAccount(
    AddBankAccountRequest addBankAccountRequest,
  );

  Future<bool> deleteBankAccount({required int bankId});

  Future<EstimateTaxResponse> estimateTax(num value);

  Future requestWithdrawOtp();

  Future<void> withdraw(WithdrawRequest request);

  Future<void> setDefaultBankAccount(
      {required int id, required bool isDefault});

  Future<String> storageUploadUrl(XFile xFile, String prefix);
}
