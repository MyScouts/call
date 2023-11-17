import 'package:app_main/src/data/models/payloads/upgrade_account/upgrade_ja/confirm_register_ja_payload.dart';
import 'package:app_main/src/data/models/payloads/upgrade_account/upgrade_ja/update_bank_account_payload.dart';
import 'package:app_main/src/data/models/payloads/upgrade_account/upgrade_pdone/pdone_request_protector_req.dart';
import 'package:app_main/src/data/models/payloads/upgrade_account/upgrade_pdone/pdone_verify_protector.dart';
import 'package:app_main/src/data/models/payloads/upgrade_account/upgrade_pdone/upgrade_pdone_payload.dart';
import 'package:app_main/src/data/models/responses/api_verify_response.dart';
import 'package:app_main/src/data/models/responses/confirm_register_ja_response.dart';
import 'package:app_main/src/data/models/responses/ja_status_response.dart';
import 'package:app_main/src/data/models/responses/pdone/pdone_information_response.dart';
import 'package:app_main/src/data/models/responses/pdone/pdone_my_protector_information_response.dart';
import 'package:app_main/src/domain/entities/update_account/bank_acount/bank_account.dart';
import 'package:camera/camera.dart';

import '../../data/models/payloads/upgrade_account/upgrade_ja/verify_phone_otp.dart';
import '../../data/models/responses/register_pdone_response.dart';
import '../../data/models/responses/upgrade_account_response.dart';
import '../entities/bank.dart';
import '../entities/update_account/check_protector_payload.dart';
import '../entities/update_account/kyc_status.dart';
import '../entities/update_account/register_pdone_with_phone_payload.dart';
import '../entities/update_account/update_pdone_kyc_payload.dart';
import '../entities/update_account/update_profile_payload.dart';
import '../entities/update_account/upgrade_account.dart';
import '../entities/update_account/verify_phone_register_pdone_payload.dart';

abstract class UpgradeAccountRepository {
  Future<KycStatus> currentStep();

  Future<UpgradeAccount> getListData();

  Future<bool> updatePDoneProfileOver18(UpdateProfilePayload payload);

  Future<bool> updatePDoneProfileRange15To18(UpdateProfilePayload payload);

  Future<bool> updatePDoneProfileBirthCer(UpdateProfilePayload payload);

  Future<bool> updateKyc(UpdatePDoneKYCPayload payload);

  Future<RegisterPDoneResponse> registerPDoneAccount(
      RegisterPDoneAccountPayload payload);

  Future<bool> verifyOtpRegisterPDone(VerifyOtpPDonePayload payload);

  Future<RegisterPDoneResponse> resendOtpPhone(
      RegisterPDoneAccountPayload payload);

  Future<RegisterPDoneResponse> resendOtpEmail(
      RegisterPDoneAccountPayload payload);

  Future<UpgradeAccountResponse> registerJA();

  Future<dynamic> registerJAVerifyOtp({required VerifyPhoneOtpPayload payload});

  Future<UpgradeAccountResponse> resendOtpJA();

  Future<bool> checkIsPDone(String id);

  Future<List<Bank>> listBanks();

  Future<RegisterPDoneResponse> checkProtector(CheckProtectorPayload payload);

  Future<BankAccount> updateBankAccount(UpdateBankAccountPayload payload);

  Future<JAStatusResponse> getJAStatus();

  Future<ConfirmRegisterJAResponse> confirmJARegister(
      ConfirmRegisterJAPayload payload);

  Future<BankAccount> getDefaultBank();

  Future<int> verifyProtector({required PDoneVerifyProtectorRequest payload});

  Future<String> uploadBirthCer(XFile xFile, String prefix);

  Future<APIVerifyResponse> requestProtector(
      {required PDoneRequestProtectorReq req});

  Future<PDoneInformationResponse> pDoneProfile();

  Future<PDoneMyProtectorInformationResponse> protectorRequested();

  Future upgradePDone(UpgradePDonePayload payload);

  Future<bool> upgradeEkyc(UpdateProfilePayload payload);
}
