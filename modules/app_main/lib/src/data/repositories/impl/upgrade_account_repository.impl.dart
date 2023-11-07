import 'package:app_main/src/data/models/payloads/upgrade_account/upgrade_ja/confirm_register_ja_payload.dart';
import 'package:app_main/src/data/models/payloads/upgrade_account/upgrade_ja/update_bank_account_payload.dart';
import 'package:app_main/src/data/models/responses/confirm_register_ja_response.dart';
import 'package:app_main/src/data/models/responses/ja_status_response.dart';
import 'package:app_main/src/domain/entities/update_account/bank_acount/bank_account.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/bank.dart';
import '../../../domain/entities/update_account/check_protector_payload.dart';
import '../../../domain/entities/update_account/kyc_status.dart';
import '../../../domain/entities/update_account/register_pdone_with_phone_payload.dart';
import '../../../domain/entities/update_account/update_pdone_kyc_payload.dart';
import '../../../domain/entities/update_account/update_profile_payload.dart';
import '../../../domain/entities/update_account/upgrade_account.dart';
import '../../../domain/entities/update_account/verify_phone_register_pdone_payload.dart';
import '../../../domain/repository/upgrade_account_repository.dart';
import '../../data_sources/remote/upgrade_account_api.dart';
import '../../models/payloads/upgrade_account/upgrade_ja/verify_phone_otp.dart';
import '../../models/responses/register_pdone_response.dart';
import '../../models/responses/upgrade_account_response.dart';

@Injectable(as: UpgradeAccountRepository)
class UpgradeAccountRepositoryImpl extends UpgradeAccountRepository {
  final UpgradeAccountApi _upgradeAccountApi;

  UpgradeAccountRepositoryImpl(this._upgradeAccountApi);

  @override
  Future<UpgradeAccount> getListData() async {
    final res = await _upgradeAccountApi.getListData();

    return res.data;
  }

  @override
  Future<bool> updatePDoneProfile(UpdateProfilePayload payload) async {
    final res =
        await _upgradeAccountApi.updatePDoneProfile(payload: payload.toJson());

    return res.success;
  }

  @override
  Future<bool> updateKyc(UpdatePDoneKYCPayload payload) async {
    final res = await _upgradeAccountApi.updateKyc(payload: payload);

    return res.success;
  }

  @override
  Future<RegisterPDoneResponse> registerPDoneAccount(
      RegisterPDoneAccountPayload payload) async {
    try {
      final res =
          await _upgradeAccountApi.registerPDoneAccount(payload: payload);

      return res.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RegisterPDoneResponse> resendOtpPhone(
      RegisterPDoneAccountPayload payload) async {
    final res = await _upgradeAccountApi.resendOtpPhone(payload: payload);

    return res.data;
  }

  @override
  Future<RegisterPDoneResponse> resendOtpEmail(
      RegisterPDoneAccountPayload payload) async {
    final res = await _upgradeAccountApi.resendOtpEmail(payload: payload);

    return res.data;
  }

  @override
  Future<bool> verifyOtpRegisterPDone(VerifyOtpPDonePayload payload) async {
    final res = payload.email != null
        ? await _upgradeAccountApi.registerPDoneVerifyEmail(payload: payload)
        : await _upgradeAccountApi.registerPDoneVerifyPhone(payload: payload);

    return res.success;
  }

  @override
  Future<KycStatus> currentStep() async {
    final response = await _upgradeAccountApi.currentStep();

    return response.data;
  }

  @override
  Future<UpgradeAccountResponse> registerJA() async {
    final response = await _upgradeAccountApi.registerJA();
    return response;
  }

  @override
  Future<bool> registerJAVerifyOtp(
      {required VerifyPhoneOtpPayload payload}) async {
    final response =
        await _upgradeAccountApi.registerJAVerifyOtp(payload: payload);
    return response.success;
  }

  @override
  Future<UpgradeAccountResponse> resendOtpJA() async {
    final response = await _upgradeAccountApi.resendOtpJA();
    return response;
  }

  @override
  Future<bool> checkIsPDone(String id) async {
    final response = await _upgradeAccountApi.checkIsPDone(id: id);
    return response.data;
  }

  @override
  Future<List<Bank>> listBanks() async {
    final response = await _upgradeAccountApi.listBanks();
    return response.data;
  }

  @override
  Future<RegisterPDoneResponse> checkProtector(
      CheckProtectorPayload payload) async {
    final response = await _upgradeAccountApi.checkProtector(payload: payload);
    return response.data;
  }

  @override
  Future<bool> checkProtectorVerifyOTP(VerifyOtpPDonePayload payload) async {
    final response =
        await _upgradeAccountApi.checkProtectorVerifyOTP(payload: payload);
    return response.data;
  }

  @override
  Future<BankAccount> updateBankAccount(
      UpdateBankAccountPayload payload) async {
    final response =
        await _upgradeAccountApi.updateBankAccount(payload: payload);

    return response.data;
  }

  @override
  Future<ConfirmRegisterJAResponse> confirmJARegister(
      ConfirmRegisterJAPayload payload) async {
    final response =
        await _upgradeAccountApi.confirmRegisterJA(payload: payload);

    return response;
  }

  @override
  Future<JAStatusResponse> getJAStatus() async {
    final response = await _upgradeAccountApi.getJAStatus();

    return response;
  }

  @override
  Future<BankAccount> getDefaultBank() async {
    final response = await _upgradeAccountApi.getDefaultBank();

    return response.data;
  }
}
