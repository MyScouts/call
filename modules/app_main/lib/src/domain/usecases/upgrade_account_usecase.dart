import 'package:app_main/src/data/models/payloads/upgrade_account/upgrade_ja/update_bank_account_payload.dart';
import 'package:injectable/injectable.dart';

import '../../data/data_sources/ekyc/ekyc_viettel.dart';
import '../../data/models/payloads/upgrade_account/upgrade_ja/verify_phone_otp.dart';
import '../../data/models/responses/register_pdone_response.dart';
import '../../data/models/responses/upgrade_account_response.dart';
import '../entities/bank.dart';
import '../entities/commity_action_type.dart';
import '../entities/update_account/bank_acount/bank_account.dart';
import '../entities/update_account/check_protector_payload.dart';
import '../entities/update_account/kyc_status.dart';
import '../entities/update_account/register_pdone_with_phone_payload.dart';
import '../entities/update_account/update_pdone_kyc_payload.dart';
import '../entities/update_account/update_profile_payload.dart';
import '../entities/update_account/upgrade_account.dart';
import '../entities/update_account/verify_phone_register_pdone_payload.dart';
import '../repository/upgrade_account_repository.dart';

@injectable
class UpgradeAccountUsecase {
  final UpgradeAccountRepository _upgradeAccountRepository;
  final EKycViettel _eKycViettel;

  UpgradeAccountUsecase(this._upgradeAccountRepository, this._eKycViettel);

  Future<KycStatus> currentStep() => _upgradeAccountRepository.currentStep();

  Future<UpgradeAccount> getListData() {
    return _upgradeAccountRepository.getListData();
  }

  Future<RegisterPDoneResponse> registerPDoneAccount(
      RegisterPDoneAccountPayload payload) {
    return _upgradeAccountRepository.registerPDoneAccount(payload);
  }

  Future<RegisterPDoneResponse> resendOtpPhone(
      RegisterPDoneAccountPayload payload) {
    return _upgradeAccountRepository.resendOtpPhone(payload);
  }

  Future<RegisterPDoneResponse> resendOtpEmail(
      RegisterPDoneAccountPayload payload) {
    return _upgradeAccountRepository.resendOtpEmail(payload);
  }

  Future<bool> updatePDoneProfile(UpdateProfilePayload payload) {
    return _upgradeAccountRepository.updatePDoneProfile(payload);
  }

  Future<bool> updateKYC(UpdatePDoneKYCPayload payload) {
    return _upgradeAccountRepository.updateKyc(payload);
  }

  Future<bool> verifyOtpRegisterPDone(VerifyOtpPDonePayload payload) async {
    return _upgradeAccountRepository.verifyOtpRegisterPDone(payload);
  }

  Future<UpgradeAccountResponse> registerJA() {
        return _upgradeAccountRepository.registerJA();
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

  Future<RegisterPDoneResponse> checkProtector(
      CheckProtectorPayload payload) async {
    return _upgradeAccountRepository.checkProtector(payload);
  }

  Future<bool> checkProtectorVerifyOTP(VerifyOtpPDonePayload payload) async {
    return _upgradeAccountRepository.checkProtectorVerifyOTP(payload);
  }

  Future<BankAccount> updateBankAccount(
      UpdateBankAccountPayload payload) async {
    return _upgradeAccountRepository.updateBankAccount(payload);
  }

  Future<Map<String, dynamic>> extractIdCardInformation(EKycIdCardRequest request) async {
    return _eKycViettel.extractIdCard(request);
  }
}
