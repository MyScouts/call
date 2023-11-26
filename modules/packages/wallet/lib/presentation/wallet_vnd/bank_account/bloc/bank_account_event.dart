part of 'bank_account_bloc.dart';

@freezed
class BankAccountEvent with _$BankAccountEvent {
  const factory BankAccountEvent.getBankAccounts() = _GetBankAccounts;

  const factory BankAccountEvent.getAllBanksInfo() = _GetAllBanksInfo;

  const factory BankAccountEvent.getOtp({@Default(false) bool isResend}) =
      _GetOtp;

  const factory BankAccountEvent.addBankAccount(
      {required AddBankAccountRequest request}) = _AddBankAccount;

  const factory BankAccountEvent.uploadImage({required File file}) =
      _UploadImage;

  const factory BankAccountEvent.deleteBankAccount({required int bankId}) =
      _DeleteBankAccount;

  const factory BankAccountEvent.getVndWalletInfo() = _GetVndWalletInfo;

  const factory BankAccountEvent.estimateTax({required num value}) =
      _EstimateTax;

  const factory BankAccountEvent.withdraw({required WithdrawRequest request}) =
      _Withdraw;

  const factory BankAccountEvent.setDefaultBankAccount(
      {required int bankAccountId,
      required bool isDefault}) = _SetDefaultBankAccount;
}
