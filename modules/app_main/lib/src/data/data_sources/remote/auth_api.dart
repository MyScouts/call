import 'package:app_main/src/data/models/payloads/auth/authentication_payload.dart';
import 'package:app_main/src/data/models/responses/authenticate_response.dart';
import 'package:app_main/src/domain/entities/change_password_payload.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/networking/api_response.dart';
import '../../models/payloads/auth/authentication_phone_payload.dart';
import '../../models/responses/otp_response.dart';

part 'auth_api.g.dart';

class AuthApiConstant {
  static const String loginWithPhone = "api/v1/auth/sms/login";
  static const String registerWithPhone = 'api/v1/auth/sms/register';
  static const String phoneCompletedRegister =
      'api/v1/auth/sms/complete-register';
  static const String forgotPassword = "api/v1/auth/sms/forgot-password";
  static const String resetPasswordToken =
      "api/v1/auth/sms/reset-password-token";
  static const String resetPassword = "api/v1/auth/sms/reset-password";
  static const String otpV1 = "api/v1/auth/otp";
  static const getOtp = '/api/sms/send-otp';
  static const authClaimV1 = '/api/v1/auth/code/claim';
  static const authClaimV2 = '/api/v1/tablet/code/claim';
  static const String changePassword = "api/v1/user/password";
}

@RestApi()
@injectable
abstract class AuthApi {
  @factoryMethod
  factory AuthApi(Dio dio) = _AuthApi;

  @POST(AuthApiConstant.loginWithPhone)
  Future<LoginResponse> loginWithPhone(
    @Body() AuthenticationPhonePayload body,
  );

  @POST(AuthApiConstant.registerWithPhone)
  Future registerWithPhone(@Body() RegisterPhonePayload body);

  @POST(AuthApiConstant.phoneCompletedRegister)
  Future<PhoneCompleteRegister> phoneCompleteRegister(
    @Body() CompletedPhoneRegisterPayload body,
  );

  @POST(AuthApiConstant.forgotPassword)
  Future forgotPassword(@Body() ForgotPasswordPayload payload);

  @POST(AuthApiConstant.resetPasswordToken)
  Future<ResetPasswordTokenResponse> resetPasswordToken(
    @Body() ResetPasswordTokenPayload payload,
  );

  @POST(AuthApiConstant.resetPassword)
  Future<ResetPasswordResponse> resetPassword(
    @Body() ResetPasswordPayload payload,
  );

  @GET(AuthApiConstant.getOtp)
  Future<ApiResponse<OtpResponse>> getOtp();

  @POST(AuthApiConstant.otpV1)
  Future getOtpV1();

  @POST(AuthApiConstant.authClaimV1)
  Future authClaimV1(@Body() AuthClaimPayload payload);

  @POST(AuthApiConstant.authClaimV2)
  Future authClaimV2(@Body() AuthClaimPayload payload);

  @PUT(AuthApiConstant.changePassword)
  Future changePassword(@Body() ChangePasswordPayload payload);
}
