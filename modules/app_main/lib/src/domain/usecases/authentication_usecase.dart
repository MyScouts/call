import 'package:app_main/src/data/models/payloads/auth/authentication_payload.dart';
import 'package:app_main/src/data/models/payloads/auth/authentication_phone_payload.dart';
import 'package:app_main/src/data/repositories/user_repository.dart';
import 'package:app_main/src/domain/usecases/user_share_preferences_usecase.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/responses/authenticate_response.dart';
import '../../data/repositories/auth_repository.dart';
import '../entities/update_account/otp/otp.dart';

@injectable
class AuthenticationUsecase {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;
  final UserSharePreferencesUsecase _userSharePreferencesUsecase;

  AuthenticationUsecase(
    this._authRepository,
    this._userSharePreferencesUsecase,
    this._userRepository,
  );

  Future<void> signOut([bool forceLogout = false]) async {
    if (forceLogout == false) {
      await _authRepository.logout();
    }
  }

  Future<LoginResponse> login({
    required AuthenticationPhonePayload payload,
  }) async {
    final response = await _authRepository.loginWithPhone(payload);
    await _userSharePreferencesUsecase.saveToken(
      response.accessToken,
      response.refreshToken,
    );
    final user = await _userRepository.getProfile();
    _userSharePreferencesUsecase.saveUserInfo(user!);
    return response;
  }

  Future registerWithPhone(AuthenticationPhonePayload payload) {
    return _authRepository.registerWithPhone(
      password: payload.password,
      phone: payload.phoneNumber,
      phoneCode: payload.phoneCode,
    );
  }

  Future phoneCompletedRegister(CompletedPhoneRegisterPayload payload) async {
    final response = await _authRepository.completeRegister(payload);
    await _userSharePreferencesUsecase.saveToken(
      response.accessToken,
      response.refreshToken,
    );
    return true;
  }

  Future<Otp> getOtp() async {
    final response = await _authRepository.getOtp();
    return response;
  }

  Future forgotPassword(ForgotPasswordPayload payload) async {
    await _authRepository.forgotPassword(payload);
    return true;
  }

  Future<ResetPasswordTokenResponse> resetPasswordToken(
      ResetPasswordTokenPayload payload) {
    return _authRepository.resetPasswordToken(payload);
  }

  Future resetPassword(ResetPasswordPayload payload) async {
    final response = await _authRepository.resetPassword(payload);
    await _userSharePreferencesUsecase.saveToken(
      response.accessToken,
      response.refreshToken,
    );
    return true;
  }

  Future otp() async {
    return _authRepository.otp();
  }

  Future logout() async {
    await _userSharePreferencesUsecase.clearUserData();
  }
}

enum CredentialType { phone, email }
