import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/payloads/auth/authentication_phone_payload.dart';
import '../../models/responses/api_response.dart';
import '../../models/responses/login_response.dart';
import '../../models/responses/register_with_phone_response.dart';

part 'auth_api.g.dart';

class AuthApiConstant {
  static const String loginWithPhone = "api/auth/phone/login";
  static const String registerWithPhone = 'api/auth/phone/register';
}

@RestApi()
@injectable
abstract class AuthApi {
  @factoryMethod
  factory AuthApi(Dio dio) = _AuthApi;

  @POST(AuthApiConstant.loginWithPhone)
  Future<ApiResponse<LoginResponse>> loginWithPhone(
    @Body() AuthenticationPhonePayload body,
  );

  @POST(AuthApiConstant.registerWithPhone)
  Future<ApiResponse<RegisterWithPhoneResponse>> registerWithPhone(
    @Body() AuthenticationPhonePayload body,
  );
}