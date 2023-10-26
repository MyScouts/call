import 'package:app_main/src/data/data_sources/remote/auth_api.dart';
import 'package:app_main/src/data/models/payloads/auth/authentication_phone_payload.dart';
import 'package:app_main/src/data/models/responses/authenticate_response.dart';
import 'package:app_main/src/data/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final AuthApi _authApi;

  AuthRepositoryImpl(
    this._authApi,
  );

  @override
  Future<LoginResponse> loginWithPhone(AuthenticationPhonePayload payload) {
    return _authApi.loginWithPhone(payload);
  }

  @override
  Future registerWithPhone({
    required String phone,
    required String password,
    required String phoneCode,
  }) {
    return _authApi.registerWithPhone(AuthenticationPhonePayload(
      phoneNumber: phone,
      password: password,
      phoneCode: phoneCode,
    ));
  }

  @override
  Future<bool> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<PhoneCompleteRegister> completeRegister(
    CompletedPhoneRegisterPayload payload,
  ) {
    return _authApi.phoneCompleteRegister(payload);
  }
}
