import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/payloads/upgrade_account/upgrade_ja/update_bank_account_payload.dart';
import 'package:app_main/src/domain/entities/update_account/bank_acount/bank_account.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';

import '../../../data/models/payloads/upgrade_account/upgrade_ja/upgrade_ja_payload.dart';
import '../../../data/models/payloads/upgrade_account/upgrade_ja/verify_phone_otp.dart';
import '../../../data/models/responses/upgrade_account_response.dart';
import '../../../domain/entities/bank.dart';
import '../../../domain/entities/commity_action_type.dart';
import '../../../domain/usecases/community_usecase.dart';
import '../../../domain/usecases/upgrade_account_usecase.dart';

typedef UpgradeAccountBloc = GetDetailBlocParam2<UpgradeAccountResponse, UpgradeJAPayload?, PDoneActionType>;

typedef UpgradeAccountVerifyPhoneBloc = GetDetailBlocParam2<bool, VerifyPhoneOtpPayload, PDoneActionType>;

typedef ResendOTPPhoneBloc = GetDetailBlocParam1<UpgradeAccountResponse, PDoneActionType>;

typedef UpdateBankAccountBloc = GetDetailBlocParam1<BankAccount, UpdateBankAccountPayload>;

typedef GetListBanksBloc = GetListBloc<Bank>;

typedef GetGroupDetailByBossIDBloc = GetDetailBlocParam1<GroupDetail, String>;

@module
abstract class UpgradeAgreePolicyBlocFactory {
  @factory
  UpgradeAccountBloc createUpgradeAccountBloc(UpgradeAccountUsecase usecase) =>
      UpgradeAccountBloc(usecase.registerAccount);

  @factory
  UpgradeAccountVerifyPhoneBloc createUpgradeAccountVerifyPhoneBloc(UpgradeAccountUsecase usecase) =>
      UpgradeAccountVerifyPhoneBloc(usecase.verifyOtpPhone);

  @factory
  ResendOTPPhoneBloc createResendOTPPhoneBloc(UpgradeAccountUsecase usecase) =>
      ResendOTPPhoneBloc(usecase.resendOtpPhoneJAVShop);

  @factory
  GetListBanksBloc createGetListBanksBloc(UpgradeAccountUsecase usecase) => GetListBanksBloc(usecase.listBanks);

  @factory
  GetGroupDetailByBossIDBloc createGetGroupDetailByBossIDBloc(CommunityUsecase usecase) {
    return GetGroupDetailByBossIDBloc(usecase.getGroupDetailByBossID);
  }

  @factory
  UpdateBankAccountBloc createUpdateBankAccountBloc(UpgradeAccountUsecase usecase) {
    return UpdateBankAccountBloc(usecase.updateBankAccount);
  }
}
