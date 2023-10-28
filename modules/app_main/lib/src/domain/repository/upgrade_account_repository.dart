
import '../../data/models/payloads/upgrade_account/upgrade_ja/upgrade_ja_payload.dart';
import '../../data/models/payloads/upgrade_account/upgrade_ja/verify_phone_otp.dart';
import '../../data/models/responses/upgrade_account_response.dart';
import '../entities/bank.dart';

abstract class UpgradeAccountRepository {
  // Future<KycStatus> currentStep();
  //
  // Future<UpgradeAccount> getListData();
  //
  // Future<bool> updatePDoneProfile(UpdateProfilePayload payload);
  //
  // Future<bool> updateKyc(UpdatePDoneKYCPayload payload);
  //
  // Future<RegisterPDoneResponse> registerPDoneAccount(
  //     RegisterPDoneAccountPayload payload);
  //
  // Future<bool> verifyOtpRegisterPDone(VerifyOtpPDonePayload payload);
  //
  // Future<RegisterPDoneResponse> resendOtpPhone(
  //     RegisterPDoneAccountPayload payload);
  //
  // Future<RegisterPDoneResponse> resendOtpEmail(
  //     RegisterPDoneAccountPayload payload);

  Future<UpgradeAccountResponse> registerJA(
      {required UpgradeJAPayload payload});

  Future<bool> registerJAVerifyOtp({required VerifyPhoneOtpPayload payload});

  Future<UpgradeAccountResponse> registerVShop();

  Future<bool> registerVShopVerifyOtp({required VerifyPhoneOtpPayload payload});

  Future<UpgradeAccountResponse> resendOtpJA();

  Future<UpgradeAccountResponse> resendOtpVShop();

  Future<bool> checkIsPDone(String id);

  Future<List<Bank>> listBanks();

  // Future<RegisterPDoneResponse> checkProtector(CheckProtectorPayload payload);
  //
  // Future<bool> checkProtectorVerifyOTP(VerifyOtpPDonePayload payload);
}
