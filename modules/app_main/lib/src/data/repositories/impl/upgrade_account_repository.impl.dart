import 'package:injectable/injectable.dart';

import '../../../domain/entities/bank.dart';
import '../../../domain/repository/upgrade_account_repository.dart';
import '../../data_sources/remote/upgrade_account_api.dart';
import '../../models/payloads/upgrade_account/upgrade_ja/upgrade_ja_payload.dart';
import '../../models/payloads/upgrade_account/upgrade_ja/verify_phone_otp.dart';
import '../../models/responses/upgrade_account_response.dart';

@Injectable(as: UpgradeAccountRepository)
class UpgradeAccountRepositoryImpl extends UpgradeAccountRepository {
  final UpgradeAccountApi _upgradeAccountApi;

  UpgradeAccountRepositoryImpl(this._upgradeAccountApi);

  // @override
  // Future<UpgradeAccount> getListData() async {
  //   // final json = jsonDecode(kycMasterData);
  //   // final value = ApiResponse<UpgradeAccount>.fromJson(
  //   //   json,
  //   //   (json) => UpgradeAccount.fromJson(json as Map<String, dynamic>),
  //   // );
  //
  //   // return value.data;
  //   final res = await _upgradeAccountApi.getListData();
  //
  //   return res.data;
  // }

  // @override
  // Future<bool> updatePDoneProfile(UpdateProfilePayload payload) async {
  //   final res = await _upgradeAccountApi.updatePDoneProfile(payload: payload);
  //
  //   return res.success;
  // }
  //
  // @override
  // Future<bool> updateKyc(UpdatePDoneKYCPayload payload) async {
  //   final res = await _upgradeAccountApi.updateKyc(payload: payload);
  //
  //   return res.success;
  // }
  //
  // @override
  // Future<RegisterPDoneResponse> registerPDoneAccount(
  //     RegisterPDoneAccountPayload payload) async {
  //   try {
  //     final res =
  //         await _upgradeAccountApi.registerPDoneAccount(payload: payload);
  //
  //     return res.data;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // @override
  // Future<RegisterPDoneResponse> resendOtpPhone(
  //     RegisterPDoneAccountPayload payload) async {
  //   final res = await _upgradeAccountApi.resendOtpPhone(payload: payload);
  //
  //   return res.data;
  // }
  //
  // @override
  // Future<RegisterPDoneResponse> resendOtpEmail(
  //     RegisterPDoneAccountPayload payload) async {
  //   final res = await _upgradeAccountApi.resendOtpEmail(payload: payload);
  //
  //   return res.data;
  // }
  //
  // @override
  // Future<bool> verifyOtpRegisterPDone(VerifyOtpPDonePayload payload) async {
  //   final res = payload.email != null
  //       ? await _upgradeAccountApi.registerPDoneVerifyEmail(payload: payload)
  //       : await _upgradeAccountApi.registerPDoneVerifyPhone(payload: payload);
  //
  //   return res.success;
  // }
  //
  // @override
  // Future<KycStatus> currentStep() async {
  //   final response = await _upgradeAccountApi.currentStep();
  //
  //   return response.data;
  // }

  @override
  Future<UpgradeAccountResponse> registerJA(
      {required UpgradeJAPayload payload}) async {
    final response = await _upgradeAccountApi.registerJA(payload: payload);
    return response.data;
  }

  @override
  Future<bool> registerJAVerifyOtp(
      {required VerifyPhoneOtpPayload payload}) async {
    final response =
        await _upgradeAccountApi.registerJAVerifyOtp(payload: payload);
    return response.success;
  }

  // @override
  // Future<UpgradeAccountResponse> registerVShop() async {
  //   final response = await _upgradeAccountApi.registerVShop();
  //   return response.data;
  // }
  //
  // @override
  // Future<bool> registerVShopVerifyOtp(
  //     {required VerifyPhoneOtpPayload payload}) async {
  //   final response =
  //       await _upgradeAccountApi.registerVShopVerifyOtp(payload: payload);
  //   return response.data;
  // }

  @override
  Future<UpgradeAccountResponse> resendOtpJA() async {
    final response = await _upgradeAccountApi.resendOtpJA();
    return response.data;
  }

  @override
  Future<UpgradeAccountResponse> resendOtpVShop() async {
    final response = await _upgradeAccountApi.resendOtpVShop();
    return response.data;
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
  Future<UpgradeAccountResponse> registerVShop() {
    // TODO: implement registerVShop
    throw UnimplementedError();
  }

  @override
  Future<bool> registerVShopVerifyOtp({required VerifyPhoneOtpPayload payload}) {
    // TODO: implement registerVShopVerifyOtp
    throw UnimplementedError();
  }

  // @override
  // Future<RegisterPDoneResponse> checkProtector(
  //     CheckProtectorPayload payload) async {
  //   final response = await _upgradeAccountApi.checkProtector(payload: payload);
  //   return response.data;
  // }
  //
  // @override
  // Future<bool> checkProtectorVerifyOTP(VerifyOtpPDonePayload payload) async {
  //   final response =
  //       await _upgradeAccountApi.checkProtectorVerifyOTP(payload: payload);
  //   return response.data;
  // }
}
