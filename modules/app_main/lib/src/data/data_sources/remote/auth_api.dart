import 'package:app_main/src/data/models/responses/authenticate_response.dart';
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

  static const getOtp = '/api/sms/send-otp';
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
  Future registerWithPhone(@Body() AuthenticationPhonePayload body);

  @POST(AuthApiConstant.phoneCompletedRegister)
  Future<PhoneCompleteRegister> phoneCompleteRegister(
    @Body() CompletedPhoneRegisterPayload body,
  );

  @GET(AuthApiConstant.getOtp)
  Future<ApiResponse<OtpResponse>> getOtp();
}
