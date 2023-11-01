import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/payloads/upgrade_account/upgrade_ja/update_bank_account_payload.dart';
import 'package:app_main/src/domain/entities/update_account/bank_acount/bank_account.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../domain/entities/bank.dart';
import '../../../domain/entities/update_account/check_protector_payload.dart';
import '../../../domain/entities/update_account/kyc_status.dart';
import '../../../domain/entities/update_account/register_pdone_with_phone_payload.dart';
import '../../../domain/entities/update_account/update_pdone_kyc_payload.dart';
import '../../../domain/entities/update_account/update_profile_payload.dart';
import '../../../domain/entities/update_account/upgrade_account.dart';
import '../../../domain/entities/update_account/verify_phone_register_pdone_payload.dart';
import '../../models/payloads/upgrade_account/upgrade_ja/upgrade_ja_payload.dart';
import '../../models/payloads/upgrade_account/upgrade_ja/verify_phone_otp.dart';
import '../../models/responses/api_response.dart';
import '../../models/responses/register_pdone_response.dart';
import '../../models/responses/upgrade_account_response.dart';

part 'upgrade_account_api.g.dart';

class UpgradeAccountApiConstants {
  static const currentStep = 'api/account-p-done/current-step';

  static const updatePDoneProfile = 'api/account-p-done/profile';

  static const registerPDone = 'api/account-p-done/profile/register-p-done';
  static const registerPDoneVerifyPhone = 'api/account-p-done/profile/phone/confirm';
  static const registerPDoneVerifyEmail = 'api/account-p-done/profile/email/confirm';

  static const updateKyc = 'api/account-p-done/add-kyc';
  static const resendOtpPhone = 'api/account-p-done/profile/phone/resend';
  static const resendOtpEmail = 'api/account-p-done/profile/email/resend';

  static const master = 'api/master';

  static const registerJA = '/api/v1/ja/register';
  static const registerJAVerifyOtp = 'api/register-community/register-ja/verify-otp';
  static const resendOtpJA = 'api/register-community/register-ja/re-send-otp';

  static const registerVShop = 'api/register-community/register-v-shop';
  static const resendOtpVShop = 'api/register-community/register-v-shop/re-send-otp';
  static const registerVShopVerifyOtp = 'api/register-community/register-v-shop/verify-otp';

  static const checkIsPDone = 'api/users/check-p-done-id/{id}';
  static const checkProtector = 'api/account-p-done/profile/check-protector';
  static const checkProtectorVerifyOTP = 'api/account-p-done/profile/check-protector/verify';
  static const listBanks = 'api/master/banks';
  static const updateBankAccount = '/api/bank-account';
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

  @PUT(UpgradeAccountApiConstants.updatePDoneProfile)
  Future<ApiResponse<dynamic>> updatePDoneProfile({
    @Body() required UpdateProfilePayload payload,
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
  Future<ApiResponse<UpgradeAccountResponse>> registerJA();

  @POST(UpgradeAccountApiConstants.registerJAVerifyOtp)
  Future<ApiResponse<dynamic>> registerJAVerifyOtp({
    @Body() required VerifyPhoneOtpPayload payload,
  });

  @POST(UpgradeAccountApiConstants.registerVShop)
  Future<ApiResponse<UpgradeAccountResponse>> registerVShop();

  @POST(UpgradeAccountApiConstants.registerVShopVerifyOtp)
  Future<ApiResponse<bool>> registerVShopVerifyOtp({
    @Body() required VerifyPhoneOtpPayload payload,
  });

  @POST(UpgradeAccountApiConstants.resendOtpJA)
  Future<ApiResponse<UpgradeAccountResponse>> resendOtpJA();

  @POST(UpgradeAccountApiConstants.resendOtpVShop)
  Future<ApiResponse<UpgradeAccountResponse>> resendOtpVShop();

  @GET(UpgradeAccountApiConstants.checkIsPDone)
  Future<ApiResponse<bool>> checkIsPDone({@Path('id') required String id});

  @GET(UpgradeAccountApiConstants.listBanks)
  Future<ApiResponse<List<Bank>>> listBanks();

  @POST(UpgradeAccountApiConstants.checkProtector)
  Future<ApiResponse<RegisterPDoneResponse>> checkProtector({
    @Body() required CheckProtectorPayload payload,
  });

  @POST(UpgradeAccountApiConstants.checkProtectorVerifyOTP)
  Future<ApiResponse<dynamic>> checkProtectorVerifyOTP({
    @Body() required VerifyOtpPDonePayload payload,
  });

  @POST(UpgradeAccountApiConstants.updateBankAccount)
  Future<ApiResponse<BankAccount>> updateBankAccount({
    @Body() required UpdateBankAccountPayload payload,
  });
}
