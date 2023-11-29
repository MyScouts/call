import 'dart:io';

import '../../data/data.dart';
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

  Future<num> estimateTax(num value);

  Future<void> withdraw(WithdrawRequest request);

  Future<void> setDefaultBankAccount(
      {required int id, required bool isDefault});
}
