import 'package:app_main/src/data/data_sources/remote/auth_api.dart';
import 'package:app_main/src/data/models/payloads/auth/authentication_payload.dart';
import 'package:app_main/src/data/models/payloads/auth/authentication_phone_payload.dart';
import 'package:app_main/src/data/models/responses/authenticate_response.dart';
import 'package:app_main/src/data/repositories/auth_repository.dart';
import 'package:app_main/src/domain/entities/change_password_payload.dart';
import 'package:app_main/src/domain/entities/update_account/otp/otp.dart';
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
    required String birthDate,
    required int sex,
  }) {
    return _authApi.registerWithPhone(RegisterPhonePayload(
      phoneNumber: phone,
      password: password,
      phoneCode: phoneCode,
      birthday: birthDate,
      sex: sex,
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

  @override
  Future forgotPassword(ForgotPasswordPayload payload) {
    return _authApi.forgotPassword(payload);
  }

  @override
  Future<ResetPasswordResponse> resetPassword(ResetPasswordPayload payload) {
    return _authApi.resetPassword(payload);
  }

  @override
  Future<ResetPasswordTokenResponse> resetPasswordToken(
    ResetPasswordTokenPayload payload,
  ) {
    return _authApi.resetPasswordToken(payload);
  }

  @override
  Future<Otp> getOtp() async {
    final response = await _authApi.getOtp();
    return response.data.otp;
  }

  @override
  Future authClaimV1(AuthClaimPayload payload) {
    return _authApi.authClaimV1(payload);
  }

  @override
  Future authClaimV2(AuthClaimPayload payload) {
    return _authApi.authClaimV2(payload);
  }

  @override
  Future changePassword(ChangePasswordPayload payload) {
    return _authApi.changePassword(payload);
  }

  @override
  Future getOtpV1() {
    return _authApi.getOtpV1();
  }
}
