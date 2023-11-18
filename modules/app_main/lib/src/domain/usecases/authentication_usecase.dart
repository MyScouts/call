import 'package:app_main/app_main.dart';
import 'package:app_main/src/core/services/notifications/notification_service.dart';
import 'package:app_main/src/data/models/payloads/auth/authentication_payload.dart';
import 'package:app_main/src/data/models/payloads/auth/authentication_phone_payload.dart';
import 'package:app_main/src/data/repositories/user_repository.dart';
import 'package:app_main/src/domain/entities/change_password_payload.dart';
import 'package:app_main/src/domain/usecases/notification_usecase.dart';
import 'package:app_main/src/domain/usecases/user_share_preferences_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/responses/authenticate_response.dart';
import '../../data/repositories/auth_repository.dart';
import '../entities/update_account/otp/otp.dart';

@injectable
class AuthenticationUsecase {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;
  final UserSharePreferencesUsecase _userSharePreferencesUsecase;
  final NotificationService _notificationService;
  final NotificationUsecase _notificationUsecase;

  AuthenticationUsecase(
    this._authRepository,
    this._userSharePreferencesUsecase,
    this._userRepository,
    this._notificationService,
    this._notificationUsecase,
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
    await syncUser();
    return response;
  }

  Future registerWithPhone(RegisterPhonePayload payload) {
    return _authRepository.registerWithPhone(
      password: payload.password,
      phone: payload.phoneNumber,
      phoneCode: payload.phoneCode,
      birthDate: payload.birthday,
      sex: payload.sex,
    );
  }

  Future phoneCompletedRegister(CompletedPhoneRegisterPayload payload) async {
    final response = await _authRepository.completeRegister(payload);
    await _userSharePreferencesUsecase.saveToken(
      response.accessToken,
      response.refreshToken,
    );
    await syncUser();
    return true;
  }

  Future<Otp> getOtp() async {
    final response = await _authRepository.getOtp();
    return response;
  }

  Future getOtpV1() {
    return _authRepository.getOtp();
  }

  Future forgotPassword(ForgotPasswordPayload payload) async {
    await _authRepository.forgotPassword(payload);
    return true;
  }

  Future<ResetPasswordTokenResponse> resetPasswordToken(
    ResetPasswordTokenPayload payload,
  ) {
    return _authRepository.resetPasswordToken(payload);
  }

  Future resetPassword(ResetPasswordPayload payload) async {
    final response = await _authRepository.resetPassword(payload);
    await _userSharePreferencesUsecase.saveToken(
      response.accessToken,
      response.refreshToken,
    );
    await syncUser();
    return true;
  }

  Future otp() async {
    return _authRepository.getOtp();
  }

  Future otpV1() async {
    return _authRepository.getOtpV1();
  }

  Future logout() async {
    await _userSharePreferencesUsecase.clearUserData();
  }

  Future syncUser() async {
    final user = await _userRepository.getProfile();
    _userSharePreferencesUsecase.saveUserInfo(user!);
    isAuthenticate.add(true);
    await _syncFCMToken();
  }

  Future authClaimV1(AuthClaimPayload payload) async {
    return _authRepository.authClaimV1(payload);
  }

  Future authClaimV2(AuthClaimPayload payload) async {
    return _authRepository.authClaimV2(payload);
  }

  Future changePassword(ChangePasswordPayload payload) {
    return _authRepository.changePassword(payload);
  }

  _syncFCMToken() async {
    final fcmToken = await _notificationService.getFCMToken();
    debugPrint("fcmToken: $fcmToken");
    if (fcmToken?.isNotEmpty ?? false) {
      await _userSharePreferencesUsecase.saveFCMToken(fcmToken!);
      try {
        await _notificationUsecase.register(fcmToken);
      } catch (e) {
        if (kDebugMode) {
          // throw Exception(e.toString());
        }
      }
    }
  }
}

enum CredentialType { phone, email }
