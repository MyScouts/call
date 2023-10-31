import 'package:app_main/src/data/models/payloads/upgrade_account/upgrade_ja/update_bank_account_payload.dart';
import 'package:app_main/src/domain/entities/update_account/bank_acount/bank_account.dart';

import '../../data/models/payloads/upgrade_account/upgrade_ja/upgrade_ja_payload.dart';
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

  Future<bool> updatePDoneProfile(UpdateProfilePayload payload);

  Future<bool> updateKyc(UpdatePDoneKYCPayload payload);

  Future<RegisterPDoneResponse> registerPDoneAccount(RegisterPDoneAccountPayload payload);

  Future<bool> verifyOtpRegisterPDone(VerifyOtpPDonePayload payload);

  Future<RegisterPDoneResponse> resendOtpPhone(RegisterPDoneAccountPayload payload);

  Future<RegisterPDoneResponse> resendOtpEmail(RegisterPDoneAccountPayload payload);

  Future<UpgradeAccountResponse> registerJA({required UpgradeJAPayload payload});

  Future<bool> registerJAVerifyOtp({required VerifyPhoneOtpPayload payload});

  Future<UpgradeAccountResponse> registerVShop();

  Future<bool> registerVShopVerifyOtp({required VerifyPhoneOtpPayload payload});

  Future<UpgradeAccountResponse> resendOtpJA();

  Future<UpgradeAccountResponse> resendOtpVShop();

  Future<bool> checkIsPDone(String id);

  Future<List<Bank>> listBanks();

  Future<RegisterPDoneResponse> checkProtector(CheckProtectorPayload payload);

  Future<bool> checkProtectorVerifyOTP(VerifyOtpPDonePayload payload);

  Future<BankAccount> updateBankAccount(UpdateBankAccountPayload payload);
}
