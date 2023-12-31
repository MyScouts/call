// ignore_for_file: depend_on_referenced_packages

import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/services/notification_center.dart';
import 'package:app_main/src/data/models/payloads/auth/authentication_payload.dart';
import 'package:app_main/src/data/models/payloads/auth/authentication_phone_payload.dart';
import 'package:app_main/src/data/models/payloads/user/user_action_payload.dart';
import 'package:app_main/src/data/models/responses/update_none_pdone_profile_response.dart';
import 'package:app_main/src/data/models/responses/update_pdone_profile_response.dart';
import 'package:app_main/src/data/models/responses/user_response.dart';
import 'package:app_main/src/domain/entities/update_account/otp/otp.dart';
import 'package:app_main/src/domain/usecases/authentication_usecase.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:localization/localization.dart';

import '../../domain/usecases/user_share_preferences_usecase.dart';
import '../../domain/usecases/user_usecase.dart';

part 'user_state.dart';

@injectable
class UserCubit extends Cubit<UserState> {
  final AuthenticationUsecase _authenticationUsecase;
  final UserSharePreferencesUsecase _userSharePreferencesUsecase;
  final UserUsecase _userUsecase;

  UserCubit(
    this._authenticationUsecase,
    this._userSharePreferencesUsecase,
    this._userUsecase,
  ) : super(UserInitial()) {
    NotificationCenter.subscribe(
        channel: refreshUser,
        observer: this,
        onNotification: (_) {
          fetchUser();
        });
  }

  Future phoneRegister({
    required String phone,
    required String password,
    required String phoneCode,
    required String birthday,
    required int sex,
  }) async {
    if (state is OnPhoneRegister) return;
    try {
      emit(OnPhoneRegister());
      await _authenticationUsecase.registerWithPhone(
        RegisterPhonePayload(
          phoneNumber: phone.toPhone,
          password: password,
          phoneCode: phoneCode,
          birthday: birthday,
          sex: sex,
        ),
      );
      emit(PhoneRegisterSuccess());
    } on DioException catch (error) {
      final data = error.response!.data;
      debugPrint("phoneRegister: $error");
      String err = S.current.messages_server_internal_error.capitalize();
      switch (data['code']) {
        case "USER_EXISTS":
          err = S.current.message_user_exits.capitalize();
          break;
        default:
          err = S.current.message_register_fail.capitalize();
          break;
      }
      emit(PhoneRegisterFail(message: err));
    } catch (error) {
      debugPrint("phoneRegister: $error");
      emit(PhoneRegisterFail(
        message: S.current.messages_server_internal_error.capitalize(),
      ));
    }
  }

  Future phoneCompletedRegister(CompletedPhoneRegisterPayload payload) async {
    if (state is OnPhoneCompletedRegister) return;
    try {
      emit(OnPhoneCompletedRegister());
      await _authenticationUsecase
          .phoneCompletedRegister(CompletedPhoneRegisterPayload(
        phoneNumber: payload.phoneNumber.toPhone,
        otp: payload.otp,
        phoneCode: payload.phoneCode,
      ));
      emit(PhoneCompletedRegisterSuccess());
    } on DioException catch (error) {
      final data = error.response!.data;
      debugPrint("phoneRegister: $error");
      String err = S.current.messages_server_internal_error.capitalize();
      switch (data['code']) {
        case "OTP_NOT_MATCH":
          err = S.current.message_otp_not_match;
        case "USER_NOT_FOUND":
          break;
        default:
          err = S.current.message_otp_not_match;
          break;
      }
      emit(PhoneCompletedRegisterFail(message: err));
    } catch (error) {
      debugPrint("phoneRegister: $error");
      emit(PhoneCompletedRegisterFail(
        message: S.current.messages_server_internal_error.capitalize(),
      ));
    }
  }

  User? _currentUser;

  User? get currentUser => _userSharePreferencesUsecase.getUserInfo();

  OnBoarding? get onboarding => _userSharePreferencesUsecase.getOnboarding();

  void setOnboarding(OnBoarding? onboarding) => _onboarding = onboarding;

  void setCurrentUser(User? user) => _currentUser = user;

  OnBoarding? _onboarding;

  Future<void> fetchUser() async {
    _currentUser = _userSharePreferencesUsecase.getUserInfo();
    final id = _currentUser?.id;
    final topic = 'user_$id';
    FirebaseMessaging.instance.subscribeToTopic(topic);

    if (id != null) {
      try {
        final user = await _userUsecase.geSynctUserById(id);
        if (user != null) {
          final response =
              await _userUsecase.getUserPublicInfo(id) ?? const User();
          await _userSharePreferencesUsecase.saveUserInfo(user.copyWith(
            isJA: _onboarding?.isJA,
            isPDone: _onboarding?.isPdone ?? false,
            birthday: response.birthday,
          ));
          setCurrentUser(user);
          emit(GetProfileSuccess(user));
        }
      } on DioException catch (error) {
        debugPrint("phoneRegister: $error");
        String err = S.current.messages_server_internal_error.capitalize();
        emit(GetProfileError(err));
      } catch (error) {
        debugPrint("phoneRegister: $error");
        emit(
          GetProfileError(
            S.current.messages_server_internal_error.capitalize(),
          ),
        );
      }
    }
  }

  Future phoneLogin(AuthenticationPhonePayload payload) async {
    if (state is OnPhoneLogin) return;
    try {
      emit(OnPhoneLogin());
      await _authenticationUsecase.login(
          payload: AuthenticationPhonePayload(
        phoneNumber: payload.phoneNumber.toPhone,
        password: payload.password,
        phoneCode: payload.phoneCode,
      ));

      await fetchUser();

      emit(PhoneLoginSuccess());
    } on DioException catch (error) {
      final data = error.response!.data;
      debugPrint("phoneRegister: $error");
      String err = S.current.messages_server_internal_error.capitalize();
      switch (data['code']) {
        case "INVALID_PASSWORD":
          err = S.current.messages_invalid_login_information.capitalize();
          break;
        case "USER_NOT_FOUND":
          err = S.current.message_user_not_found.capitalize();
        default:
          err = S.current.messages_login_fail.capitalize();
          break;
      }
      emit(PhoneLoginFail(message: err));
    } catch (error) {
      debugPrint("phoneRegister: $error");
      emit(
        PhoneLoginFail(
          message: S.current.messages_server_internal_error.capitalize(),
        ),
      );
    }
  }

  Future resendOTP(RegisterPhonePayload payload) async {
    if (state is OnResendOTP) return;
    try {
      emit(OnResendOTP());
      await _authenticationUsecase.registerWithPhone(RegisterPhonePayload(
        phoneNumber: payload.phoneNumber.toPhone,
        password: payload.password,
        phoneCode: payload.phoneCode,
        birthday: payload.birthday,
        sex: payload.sex,
      ));
      emit(ResendOTPSuccess());
    } on DioException catch (error) {
      debugPrint("phoneRegister: $error");
      String err = S.current.messages_resend_otp_fail.capitalize();
      emit(ResendOTPFail(message: err));
    } catch (error) {
      debugPrint("phoneRegister: $error");
      emit(ResendOTPFail(message: "international_error"));
    }
  }

  Future forgotPassword(ForgotPasswordPayload payload) async {
    if (state is OnForgotPassword) return;
    try {
      emit(OnForgotPassword());
      await _authenticationUsecase.forgotPassword(ForgotPasswordPayload(
        phoneNumber: payload.phoneNumber.toPhone,
        phoneCode: payload.phoneCode,
      ));
      emit(ForgotPasswordSuccess());
    } on DioException catch (error) {
      final data = error.response!.data;
      String err = S.current.messages_server_internal_error.capitalize();
      switch (data['code']) {
        case "USER_NOT_FOUND":
          err = S.current.message_user_not_found.capitalize();
      }
      emit(ForgotPasswordFail(message: err));
    } catch (error) {
      debugPrint("phoneRegister: $error");
      emit(ForgotPasswordFail(message: "international_error"));
    }
  }

  Future resendForgotPassword(ForgotPasswordPayload payload) async {
    if (state is OnResendOTP) return;
    try {
      emit(OnResendOTP());
      await _authenticationUsecase.forgotPassword(ForgotPasswordPayload(
        phoneNumber: payload.phoneNumber.toPhone,
        phoneCode: payload.phoneCode,
      ));
      emit(ResendOTPSuccess());
    } on DioException {
      String err = S.current.messages_resend_otp_fail.capitalize();
      emit(ResendOTPFail(message: err));
    } catch (error) {
      emit(ResendOTPFail(message: "international_error"));
    }
  }

  Future resetPasswordToken(ResetPasswordTokenPayload payload) async {
    if (state is OnResetPasswordToken) return;
    try {
      emit(OnResetPasswordToken());
      final response = await _authenticationUsecase
          .resetPasswordToken(ResetPasswordTokenPayload(
        phoneNumber: payload.phoneNumber.toPhone,
        phoneCode: payload.phoneCode,
        otp: payload.otp,
      ));
      emit(ResetPasswordTokenSuccess(ott: response.ott));
    } on DioException catch (error) {
      final data = error.response!.data;
      String err = S.current.messages_server_internal_error.capitalize();
      switch (data['code']) {
        case "OTP_NOT_MATCH":
          err = S.current.message_otp_not_match;
        case "USER_NOT_FOUND":
          break;
        default:
          err = S.current.message_otp_not_match;
          break;
      }
      emit(ResetPasswordTokenFail(message: err));
    } catch (error) {
      emit(ResetPasswordTokenFail(message: "international_error"));
    }
  }

  Future resetPassword(ResetPasswordPayload payload) async {
    if (state is OnResetPassword) return;
    try {
      emit(OnResetPassword());
      await _authenticationUsecase.resetPassword(payload);
      emit(ResetPasswordSuccess());
    } on DioException {
      // final data = error.response!.data;
      String err = S.current.messages_server_internal_error.capitalize();
      emit(ResetPasswordFail(message: err));
    } catch (error) {
      emit(ResetPasswordFail(message: "international_error"));
    }
  }

  Future<void> getOtp({bool? isResend}) async {
    try {
      emit(GetOTPLoading());
      final otp = await _authenticationUsecase.getOtp();
      if (isResend == true) {
        emit(ResendUserOTPSuccess(otp: otp));
        return;
      }
      emit(GetOTPSuccess(otp: otp));
    } catch (error) {
      debugPrint("phoneRegister: $error");
      emit(GetOTPFail(message: "international_error"));
    }
  }

  Future<void> getUserById({String? userId}) async {
    if (state is OnGetUserInfo) return;
    try {
      emit(OnGetUserInfo());
      _currentUser = _userSharePreferencesUsecase.getUserInfo();
      final id = userId ?? _currentUser?.id.toString();
      final user = await _userUsecase.geSynctUserById(int.parse(id!));
      emit(GetUserInfoSuccess(user));
    } on DioException catch (error) {
      debugPrint("phoneRegister: $error");
      String err = S.current.messages_server_internal_error.capitalize();
      emit(GetUserInfoFail(message: err));
    } catch (error) {
      debugPrint("phoneRegister: $error");
      emit(
        GetUserInfoFail(
          message: S.current.messages_server_internal_error.capitalize(),
        ),
      );
    }
  }

  Future<void> authQrCode({
    required String qrCode,
    required AuthClaimType type,
  }) async {
    if (state is OnLoginQRCode) return;
    try {
      emit(OnLoginQRCode());
      if (type == AuthClaimType.v1) {
        await _authenticationUsecase.authClaimV1(AuthClaimPayload(
          code: qrCode,
        ));
        emit(LoginQRCodeSuccess());
      } else {
        await _authenticationUsecase.authClaimV2(AuthClaimPayload(
          code: qrCode,
        ));
        emit(LoginQRCodeSuccess());
      }
    } on DioException catch (error) {
      final data = error.response!.data;
      emit(LoginQRCodeFail(code: data['code']));
    } catch (error) {
      debugPrint("authQrCode: $error");
      emit(LoginQRCodeFail(code: ""));
    }
  }

  Future<void> deleteUSer({
    required int userId,
    required DeleteUserPayload payload,
  }) async {
    if (state is OnDeleteUser) return;
    try {
      emit(OnDeleteUser());
      await _userUsecase.deleteUser(
        payload: payload,
        userId: userId,
      );
      await _authenticationUsecase.logout();
      emit(DeleteUserSuccess());
    } on DioException catch (error) {
      debugPrint("phoneRegister: $error");
      String err = S.current.messages_server_internal_error.capitalize();
      final data = error.response!.data;
      switch (data['code']) {
        case "PASSWORD_NOT_MATCH":
          err = "Mật khẩu không khớp";
      }
      emit(DeleteUserFail(message: err));
    } catch (error) {
      debugPrint("phoneRegister: $error");
      emit(
        DeleteUserFail(
          message: S.current.messages_server_internal_error.capitalize(),
        ),
      );
    }
  }

  Future<void> getOnboarding() async {
    if (state is OnGetOnboarding) return;
    try {
      emit(OnGetOnboarding());
      final response = await _userUsecase.onboarding();
      _onboarding = response;
      emit(OnboardingSuccess(onboarding: response));
    } catch (error) {
      debugPrint("onboarding: $error");
      emit(OnboardingFail(
          onboarding: const OnboardingResponse(
        hasDefaultBankAccount: false,
        isJA: false,
        isMarshopCustomer: false,
        isMarshopOwner: false,
        isPdone: false,
      )));
    }
  }

  Future<void> getUserPublicInfo(int id) async {
    if (state is GetUserPublicInfoLoading) return;
    try {
      emit(GetUserPublicInfoLoading());
      final response = await _userUsecase.getUserPublicInfo(id) ?? const User();
      emit(GetUserPublicInfoSuccess(user: response));
    } catch (error) {
      debugPrint("get user public info: $error");
      emit(GetUserInfoFail(message: '$error'));
    }
  }

  Future<void> updatePDoneProfile(
      {required UpdatePDoneProfilePayload updatePDoneProfilePayload}) async {
    if (state is UpdatePDoneProfileLoading) return;
    try {
      // emit(UpdatePDoneProfileLoading());
      // final response = await _userUsecase.updatePDoneProfile(updatePDoneProfilePayload);
      // emit(UpdatePDoneProfileSuccess(user: response));
    } catch (error) {
      debugPrint("update pdone profile error: $error");
      emit(UpdatePDoneProfileFailed(message: error.toString()));
    }
  }

  Future<void> updateNonePDoneProfile(
      {required UpdateNonePDoneProfilePayload
          updateNonePDoneProfilePayload}) async {
    if (state is UpdateNonePDoneProfileLoading) return;
    try {
      emit(UpdateNonePDoneProfileLoading());
      // final response = await _userUsecase
      //     .updateNonePNoneDoneProfile(updateNonePDoneProfilePayload);
      // emit(UpdateNonePDoneProfileSuccess(user: response));
    } catch (error) {
      debugPrint("update pdone profile error: $error");
      emit(UpdatePDoneProfileFailed(message: error.toString()));
    }
  }
}

enum AuthClaimType { v1, v2 }
