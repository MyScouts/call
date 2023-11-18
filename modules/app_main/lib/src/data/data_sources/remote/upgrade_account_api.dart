import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/payloads/upgrade_account/upgrade_ja/confirm_register_ja_payload.dart';
import 'package:app_main/src/data/models/payloads/upgrade_account/upgrade_ja/update_bank_account_payload.dart';
import 'package:app_main/src/data/models/payloads/upgrade_account/upgrade_pdone/pdone_request_protector_req.dart';
import 'package:app_main/src/data/models/payloads/upgrade_account/upgrade_pdone/pdone_verify_protector.dart';
import 'package:app_main/src/data/models/payloads/upgrade_account/upgrade_pdone/upgrade_pdone_payload.dart';
import 'package:app_main/src/data/models/responses/confirm_register_ja_response.dart';
import 'package:app_main/src/data/models/responses/ja_status_response.dart';
import 'package:app_main/src/data/models/responses/pdone/pdone_registering_profile.dart';
import 'package:app_main/src/domain/entities/update_account/bank_acount/bank_account.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../domain/entities/bank.dart';
import '../../../domain/entities/update_account/check_protector_payload.dart';
import '../../../domain/entities/update_account/kyc_status.dart';
import '../../../domain/entities/update_account/register_pdone_with_phone_payload.dart';
import '../../../domain/entities/update_account/update_pdone_kyc_payload.dart';
import '../../../domain/entities/update_account/upgrade_account.dart';
import '../../../domain/entities/update_account/verify_phone_register_pdone_payload.dart';
import '../../models/payloads/upgrade_account/upgrade_ja/verify_phone_otp.dart';
import '../../models/responses/api_response.dart';
import '../../models/responses/api_verify_response.dart';
import '../../models/responses/check_protector_response.dart';
import '../../models/responses/pdone/pdone_information_response.dart';
import '../../models/responses/pdone/pdone_my_protector_information_response.dart';
import '../../models/responses/register_pdone_response.dart';
import '../../models/responses/upgrade_account_response.dart';

part 'upgrade_account_api.g.dart';

class UpgradeAccountApiConstants {
  static const currentStep = 'api/account-p-done/current-step';

  static const updatePDoneProfile = 'api/v1/p-done/adult-register';
  static const updatePDoneProfileTeenager = 'api/v1/p-done/teenager-register';
  static const updatePDoneProfileChildren = 'api/v1/p-done/children-register';

  static const registerPDone = 'api/account-p-done/profile/register-p-done';
  static const registerPDoneVerifyPhone =
      'api/account-p-done/profile/phone/confirm';
  static const registerPDoneVerifyEmail =
      'api/account-p-done/profile/email/confirm';

  static const updateKyc = 'api/account-p-done/add-kyc';
  static const resendOtpPhone = 'api/account-p-done/profile/phone/resend';
  static const resendOtpEmail = 'api/account-p-done/profile/email/resend';

  static const master = 'api/master';

  static const registerJA = '/api/v1/ja/register';
  static const getJAStatus = '/api/v1/ja';
  static const registerJAVerifyOtp = '/api/v1/ja/verify-otp';
  static const resendOtpJA = '/api/v1/ja/resend-otp';
  static const confirmRegisterJA = '/api/v1/ja/confirm-registration';

  static const checkIsPDone = 'api/users/check-p-done-id/{id}';
  static const checkProtector = 'api/account-p-done/profile/check-protector';
  static const listBanks = 'api/master/banks';
  static const verifyProtector = 'api/v1/p-done/check-protector-info';
  static const requestProtector = 'api/v1/protector/request';
  static const updateBankAccount = '/api/bank-account';
  static const getDefaultBank = '/api/bank-account/default';
  static const pDoneProfile = '/api/v1/p-done/profile';
  static const protectorRequested =
      '/api/v1/protector/sent-request?page=1&pageSize=10&status=1';
  static const upgradePdone = "api/v1/p-done/upgrade";
  static const eKycUpgrade = "api/v1/p-done/e-kyc-upgrade";
  static const pDoneRegisteringProfile = "api/v1/p-done/registering-profile";
}

@RestApi()
@injectable
abstract class UpgradeAccountApi {
  @factoryMethod
  factory UpgradeAccountApi(Dio dio) = _UpgradeAccountApi;

  @GET(UpgradeAccountApiConstants.currentStep)
  Future<ApiResponse<KycStatus>> currentStep();

  @POST(UpgradeAccountApiConstants.updateKyc)
  Future<ApiResponse<dynamic>> updateKyc({
    @Body() required UpdatePDoneKYCPayload payload,
  });

  @POST(UpgradeAccountApiConstants.resendOtpPhone)
  Future<ApiResponse<RegisterPDoneResponse>> resendOtpPhone({
    @Body() required RegisterPDoneAccountPayload payload,
  });

  @POST(UpgradeAccountApiConstants.resendOtpEmail)
  Future<ApiResponse<RegisterPDoneResponse>> resendOtpEmail({
    @Body() required RegisterPDoneAccountPayload payload,
  });

  @POST(UpgradeAccountApiConstants.updatePDoneProfile)
  Future<ApiResponse<APIVerifyResponse>> updatePDoneProfileOver18({
    @Body() required dynamic payload,
  });

  @POST(UpgradeAccountApiConstants.updatePDoneProfileTeenager)
  Future<ApiResponse<APIVerifyResponse>> updatePDoneProfileRange15To18({
    @Body() required dynamic payload,
  });

  @POST(UpgradeAccountApiConstants.updatePDoneProfileChildren)
  Future<ApiResponse<APIVerifyResponse>> updatePDoneProfileBirthCer({
    @Body() required dynamic payload,
  });

  @POST(UpgradeAccountApiConstants.registerPDone)
  Future<ApiResponse<RegisterPDoneResponse>> registerPDoneAccount({
    @Body() required RegisterPDoneAccountPayload payload,
  });

  @POST(UpgradeAccountApiConstants.registerPDoneVerifyPhone)
  Future<ApiResponse<dynamic>> registerPDoneVerifyPhone({
    @Body() required VerifyOtpPDonePayload payload,
  });

  @POST(UpgradeAccountApiConstants.registerPDoneVerifyEmail)
  Future<ApiResponse<dynamic>> registerPDoneVerifyEmail({
    @Body() required VerifyOtpPDonePayload payload,
  });

  @GET(UpgradeAccountApiConstants.master)
  Future<ApiResponse<UpgradeAccount>> getListData();

  @POST(UpgradeAccountApiConstants.registerJA)
  Future<UpgradeAccountResponse> registerJA();

  @POST(UpgradeAccountApiConstants.registerJAVerifyOtp)
  Future registerJAVerifyOtp({
    @Body() required VerifyPhoneOtpPayload payload,
  });

  @POST(UpgradeAccountApiConstants.resendOtpJA)
  Future<UpgradeAccountResponse> resendOtpJA();

  @GET(UpgradeAccountApiConstants.checkIsPDone)
  Future<ApiResponse<bool>> checkIsPDone({@Path('id') required String id});

  @GET(UpgradeAccountApiConstants.listBanks)
  Future<ApiResponse<List<Bank>>> listBanks();

  @POST(UpgradeAccountApiConstants.checkProtector)
  Future<ApiResponse<RegisterPDoneResponse>> checkProtector({
    @Body() required CheckProtectorPayload payload,
  });

  @POST(UpgradeAccountApiConstants.updateBankAccount)
  Future<ApiResponse<BankAccount>> updateBankAccount({
    @Body() required UpdateBankAccountPayload payload,
  });

  @POST(UpgradeAccountApiConstants.confirmRegisterJA)
  Future<ConfirmRegisterJAResponse> confirmRegisterJA({
    @Body() required ConfirmRegisterJAPayload payload,
  });

  @GET(UpgradeAccountApiConstants.getJAStatus)
  Future<JAStatusResponse> getJAStatus();

  @GET(UpgradeAccountApiConstants.getDefaultBank)
  Future<ApiResponse<BankAccount>> getDefaultBank();

  @POST(UpgradeAccountApiConstants.verifyProtector)
  Future<ApiResponse<CheckProtectorResponse>> verifyProtector({
    @Body() required PDoneVerifyProtectorRequest payload,
  });

  @POST(UpgradeAccountApiConstants.requestProtector)
  Future<ApiResponse<APIVerifyResponse>> requestProtector({
    @Body() required PDoneRequestProtectorReq payload,
  });

  @GET(UpgradeAccountApiConstants.pDoneProfile)
  Future<ApiResponse<PDoneInformationResponse>> pDoneProfile();
  @GET(UpgradeAccountApiConstants.pDoneRegisteringProfile)
  Future<ApiResponse<PDoneRegisteringProfileResponse>> pDoneRegisteringProfile();

  @GET(UpgradeAccountApiConstants.protectorRequested)
  Future<ApiResponse<PDoneMyProtectorInformationResponse>> protectorRequested();

  @POST(UpgradeAccountApiConstants.upgradePdone)
  Future upgradePDone(@Body() UpgradePDonePayload payload);

  @POST(UpgradeAccountApiConstants.eKycUpgrade)
  Future<APIVerifyResponse> upgradeEkyc(@Body() dynamic payload);
}
