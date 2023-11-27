import 'package:app_main/src/data/models/payloads/upgrade_account/upgrade_ja/confirm_register_ja_payload.dart';
import 'package:app_main/src/data/models/payloads/upgrade_account/upgrade_ja/update_bank_account_payload.dart';
import 'package:app_main/src/data/models/payloads/upgrade_account/upgrade_pdone/pdone_request_protector_req.dart';
import 'package:app_main/src/data/models/payloads/upgrade_account/upgrade_pdone/pdone_verify_protector.dart';
import 'package:app_main/src/data/models/payloads/upgrade_account/upgrade_pdone/upgrade_pdone_payload.dart';
import 'package:app_main/src/data/models/responses/api_verify_response.dart';
import 'package:app_main/src/data/models/responses/confirm_register_ja_response.dart';
import 'package:app_main/src/data/models/responses/ja_status_response.dart';
import 'package:app_main/src/data/models/responses/pdone/pdone_check_exist_by_id_number_response.dart';
import 'package:app_main/src/data/models/responses/pdone/pdone_information_response.dart';
import 'package:app_main/src/data/models/responses/pdone/pdone_my_protector_information_response.dart';
import 'package:app_main/src/data/models/responses/pdone/pdone_registering_profile.dart';
import 'package:app_main/src/domain/entities/update_account/bank_acount/bank_account.dart';
import 'package:camera/camera.dart';
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
import '../../data_sources/remote/resource_api.dart';
import '../../data_sources/remote/upgrade_account_api.dart';
import '../../models/payloads/upgrade_account/upgrade_ja/verify_phone_otp.dart';
import '../../models/responses/register_pdone_response.dart';
import '../../models/responses/upgrade_account_response.dart';

@Injectable(as: UpgradeAccountRepository)
class UpgradeAccountRepositoryImpl extends UpgradeAccountRepository {
  final UpgradeAccountApi _upgradeAccountApi;
  final ResourceApi _resourceApi;

  UpgradeAccountRepositoryImpl(this._upgradeAccountApi, this._resourceApi);

  @override
  Future<UpgradeAccount> getListData() async {
    final res = await _upgradeAccountApi.getListData();

    return res.data;
  }

  @override
  Future<bool> updatePDoneProfileOver18(UpdateProfilePayload payload) async {
    final res = await _upgradeAccountApi.updatePDoneProfileOver18(
        payload: payload.toJson());

    return res.success;
  }

  @override
  Future<bool> updatePDoneProfileBirthCer(UpdateProfilePayload payload) async {
    final res = await _upgradeAccountApi.updatePDoneProfileBirthCer(
        payload: payload.toJson());

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
  Future registerJAVerifyOtp({required VerifyPhoneOtpPayload payload}) async {
    await _upgradeAccountApi.registerJAVerifyOtp(payload: payload);
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

  @override
  Future<int> verifyProtector(
      {required PDoneVerifyProtectorRequest payload}) async {
    final response = await _upgradeAccountApi.verifyProtector(payload: payload);
    return response.data.userId;
  }

  @override
  Future<bool> updatePDoneProfileRange15To18(
      UpdateProfilePayload payload) async {
    final res = await _upgradeAccountApi.updatePDoneProfileRange15To18(
        payload: payload.toJson());

    return res.data.result;
  }

  @override
  Future<String> uploadBirthCer(XFile xFile, String prefix) async {
    final res = await _resourceApi.storageUploadUrl(xFile, prefix);
    return res;
  }

  @override
  Future<APIVerifyResponse> requestProtector(
      {required PDoneRequestProtectorReq req}) async {
    final res = await _upgradeAccountApi.requestProtector(payload: req);
    return res.data;
  }

  @override
  Future<PDoneInformationResponse> pDoneProfile() async {
    final res = await _upgradeAccountApi.pDoneProfile();
    return res.data;
  }

  @override
  Future<PDoneMyProtectorInformationResponse> protectorRequested() async {
    final res = await _upgradeAccountApi.protectorRequested();
    return res.data;
  }

  @override
  Future upgradePDone(UpgradePDonePayload payload) =>
      _upgradeAccountApi.upgradePDone(payload);

  @override
  Future<bool> upgradeEkyc(UpdateProfilePayload payload) async {
    final response = await _upgradeAccountApi.upgradeEkyc(payload.toJson());
    return response.result;
  }

  @override
  Future<PDoneRegisteringProfileData?> getRegisteringProfile() async{
    // TODO: implement getRegisteringProfile
    final response = await _upgradeAccountApi.pDoneRegisteringProfile();
    return response.data.registeringProfile;
  }

  @override
  Future<CheckExistIdentityNumber?> checkExistIdentityNumber(String identityNumber) async{
    // TODO: implement checkExistIdentityNumber
    final response = await _upgradeAccountApi.checkExistIdentityNumber(identityNumber);
    return response;
  }

  @override
  Future<String> getEKycKey() async{
    // TODO: implement getEKycKey
    final response = await _upgradeAccountApi.getEKycKey();
    return response.value;
  }
}
