part of 'bank_account_bloc.dart';

@freezed
class BankAccountState with _$BankAccountState {
  const factory BankAccountState.initial() = _Initial;

  const factory BankAccountState.error(String err) = _Error;

  const factory BankAccountState.getBankAccountsSuccess(
      {required List<BankAccount> bankAccounts}) = _GetBankAccountsSuccess;

  const factory BankAccountState.getBankAccountsLoading() =
      _GetBankAccountsLoading;

  const factory BankAccountState.getBankAccountsError(String err) =
      _GetBankAccountsError;

  const factory BankAccountState.getAllBanksInfoSuccess() =
      _GetAllBanksInfoSuccess;

  const factory BankAccountState.getAllBanksInfoLoading() =
      _GetAllBanksInfoLoading;

  const factory BankAccountState.getOtpSuccess() = _GetOtpSuccess;

  const factory BankAccountState.getOtpLoading() = _GetOtpLoading;

  const factory BankAccountState.resendOtpLoading() = _ResendOtpLoading;

  const factory BankAccountState.resendOtpSuccess() = _ResendOtpSuccess;

  const factory BankAccountState.addBankAccountSuccess(
      {required BankAccount bankAccount}) = _AddBankAccountSuccess;

  const factory BankAccountState.addBankAccountLoading() =
      _AddBankAccountLoading;

  const factory BankAccountState.addBankAccountOtpNotMatch() =
      _AddBankAccountOtpNotMatch;

  const factory BankAccountState.uploadImageSuccess({required String imgUrl}) =
      _UploadImageSuccess;

  const factory BankAccountState.uploadImageLoading() = _UploadImageLoading;

  const factory BankAccountState.deleteBankAccountSuccess() =
      _DeleteBankAccountSuccess;

  const factory BankAccountState.deleteBankAccountLoading() =
      _DeleteBankAccountLoading;

  const factory BankAccountState.getVndWalletInfoLoading() =
      _GetVndWalletInfoLoading;

  const factory BankAccountState.getVndWalletInfoSuccess(
      VndWalletInfo vndWalletInfo) = _GetVndWalletInfoSuccess;

  const factory BankAccountState.estimateTaxSuccess(
      EstimateTaxResponse estimateTax) = _EstimateTaxSuccess;

  const factory BankAccountState.requestWithdrawOtpLoading() =
      _RequestWithdrawOtpLoading;

  const factory BankAccountState.requestWithdrawOtpSuccess() =
      _RequestWithdrawOtpSuccess;

  const factory BankAccountState.estimateTaxLoading() = _EstimateTaxLoading;

  const factory BankAccountState.withdrawLoading() = _WithdrawLoading;

  const factory BankAccountState.withdrawLoaded() = _WithdrawLoaded;

  const factory BankAccountState.setDefaultBankAccountSuccess() =
      _SetDefaultBankAccountSuccess;

  const factory BankAccountState.setDefaultBankAccountLoading() =
      _SetDefaultBankAccountLoading;

  const factory BankAccountState.resendWithdrawOtpLoading() =
      _ResendWithdrawOtpLoading;

  const factory BankAccountState.resendWithdrawOtpSuccess() =
      _ResendWithdrawOtpSuccess;
}
