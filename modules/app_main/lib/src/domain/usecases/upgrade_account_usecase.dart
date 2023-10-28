import 'package:injectable/injectable.dart';

import '../../data/models/payloads/upgrade_account/upgrade_ja/upgrade_ja_payload.dart';
import '../../data/models/payloads/upgrade_account/upgrade_ja/verify_phone_otp.dart';
import '../../data/models/responses/upgrade_account_response.dart';
import '../entities/bank.dart';
import '../entities/commity_action_type.dart';
import '../repository/upgrade_account_repository.dart';

@injectable
class UpgradeAccountUsecase {
  final UpgradeAccountRepository _upgradeAccountRepository;

  UpgradeAccountUsecase(this._upgradeAccountRepository);

  // Future<KycStatus> currentStep() => _upgradeAccountRepository.currentStep();
  //
  // Future<UpgradeAccount> getListData() {
  //   return _upgradeAccountRepository.getListData();
  // }
  //
  // Future<RegisterPDoneResponse> registerPDoneAccount(
  //     RegisterPDoneAccountPayload payload) {
  //   return _upgradeAccountRepository.registerPDoneAccount(payload);
  // }
  //
  // Future<RegisterPDoneResponse> resendOtpPhone(
  //     RegisterPDoneAccountPayload payload) {
  //   return _upgradeAccountRepository.resendOtpPhone(payload);
  // }
  //
  // Future<RegisterPDoneResponse> resendOtpEmail(
  //     RegisterPDoneAccountPayload payload) {
  //   return _upgradeAccountRepository.resendOtpEmail(payload);
  // }
  //
  // Future<bool> updatePDoneProfile(UpdateProfilePayload payload) {
  //   return _upgradeAccountRepository.updatePDoneProfile(payload);
  // }
  //
  // Future<bool> updateKYC(UpdatePDoneKYCPayload payload) {
  //   return _upgradeAccountRepository.updateKyc(payload);
  // }
  //
  // Future<bool> verifyOtpRegisterPDone(VerifyOtpPDonePayload payload) async {
  //   return _upgradeAccountRepository.verifyOtpRegisterPDone(payload);
  // }

  Future<UpgradeAccountResponse> registerAccount(
      UpgradeJAPayload? payload, PDoneActionType type) {
    return type == PDoneActionType.registerJA
        ? _upgradeAccountRepository.registerJA(payload: payload!)
        : _upgradeAccountRepository.registerVShop();
  }

  Future<bool> verifyOtpPhone(
      VerifyPhoneOtpPayload payload, PDoneActionType type) {
    return type == PDoneActionType.registerJA
        ? _upgradeAccountRepository.registerJAVerifyOtp(payload: payload)
        : _upgradeAccountRepository.registerVShopVerifyOtp(payload: payload);
  }

  Future<UpgradeAccountResponse> resendOtpPhoneJAVShop(PDoneActionType type) {
    return type == PDoneActionType.registerJA
        ? _upgradeAccountRepository.resendOtpJA()
        : _upgradeAccountRepository.resendOtpVShop();
  }

  Future<bool> checkIsPDone(String id) async {
    return _upgradeAccountRepository.checkIsPDone(id);
  }

  Future<List<Bank>> listBanks() async {
    return _upgradeAccountRepository.listBanks();
  }

  // Future<RegisterPDoneResponse> checkProtector(
  //     CheckProtectorPayload payload) async {
  //   return _upgradeAccountRepository.checkProtector(payload);
  // }
  //
  // Future<bool> checkProtectorVerifyOTP(VerifyOtpPDonePayload payload) async {
  //   return _upgradeAccountRepository.checkProtectorVerifyOTP(payload);
  // }
}
