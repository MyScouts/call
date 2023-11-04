import 'package:app_main/src/data/models/payloads/upgrade_account/upgrade_ja/confirm_register_ja_payload.dart';
import 'package:app_main/src/data/models/payloads/upgrade_account/upgrade_ja/update_bank_account_payload.dart';
import 'package:app_main/src/data/models/responses/confirm_register_ja_response.dart';
import 'package:app_main/src/data/models/responses/ja_status_response.dart';
import 'package:app_main/src/domain/entities/update_account/bank_acount/bank_account.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';

import '../../../data/models/payloads/upgrade_account/upgrade_ja/verify_phone_otp.dart';
import '../../../data/models/responses/upgrade_account_response.dart';
import '../../../domain/entities/bank.dart';
import '../../../domain/entities/commity_action_type.dart';
import '../../../domain/usecases/upgrade_account_usecase.dart';

typedef UpgradeJABloc = GetDetailBloc<UpgradeAccountResponse>;

typedef GetJAStatusBloc = GetDetailBloc<JAStatusResponse>;

typedef GetDefaultBankBloc = GetDetailBloc<BankAccount>;

typedef ConfirmRegisterJABloc
    = GetDetailBlocParam1<ConfirmRegisterJAResponse, ConfirmRegisterJAPayload>;

typedef UpgradeAccountVerifyPhoneBloc
    = GetDetailBlocParam1<bool, VerifyPhoneOtpPayload>;

typedef ResendOTPPhoneBloc
    = GetDetailBlocParam1<UpgradeAccountResponse, PDoneActionType>;

typedef UpdateBankAccountBloc
    = GetDetailBlocParam1<BankAccount, UpdateBankAccountPayload>;

typedef GetListBanksBloc = GetListBloc<Bank>;

@module
abstract class UpgradeAgreePolicyBlocFactory {
  @factory
  UpgradeJABloc createUpgradeAccountBloc(UpgradeAccountUsecase usecase) =>
      UpgradeJABloc(usecase.registerJA);

  @factory
  UpgradeAccountVerifyPhoneBloc createUpgradeAccountVerifyPhoneBloc(
          UpgradeAccountUsecase usecase) =>
      UpgradeAccountVerifyPhoneBloc(usecase.verifyOtpPhone);

  @factory
  ResendOTPPhoneBloc createResendOTPPhoneBloc(UpgradeAccountUsecase usecase) =>
      ResendOTPPhoneBloc(usecase.resendOtpPhoneJA);

  @factory
  GetListBanksBloc createGetListBanksBloc(UpgradeAccountUsecase usecase) =>
      GetListBanksBloc(usecase.listBanks);

  @factory
  UpdateBankAccountBloc createUpdateBankAccountBloc(
      UpgradeAccountUsecase usecase) {
    return UpdateBankAccountBloc(usecase.updateBankAccount);
  }

  @factory
  GetDefaultBankBloc createGetDefaultBankBloc(UpgradeAccountUsecase usecase) {
    return GetDefaultBankBloc(usecase.getDefaultBank);
  }

  @factory
  GetJAStatusBloc createGetJAStatusBloc(UpgradeAccountUsecase usecase) {
    return GetJAStatusBloc(usecase.getJAStatus);
  }

  @factory
  ConfirmRegisterJABloc createConfirmRegisterJABloc(
      UpgradeAccountUsecase usecase) {
    return ConfirmRegisterJABloc(usecase.confirmJARegister);
  }
}
