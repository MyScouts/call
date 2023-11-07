// ignore_for_file: depend_on_referenced_packages

import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/payloads/auth/authentication_payload.dart';
import 'package:app_main/src/data/models/payloads/auth/authentication_phone_payload.dart';
import 'package:app_main/src/domain/entities/update_account/otp/otp.dart';
import 'package:app_main/src/domain/usecases/authentication_usecase.dart';
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
  ) : super(UserInitial());

  Future phoneRegister({
    required String phone,
    required String password,
    required String phoneCode,
  }) async {
    if (state is OnPhoneRegister) return;
    try {
      emit(OnPhoneRegister());
      await _authenticationUsecase.registerWithPhone(
        AuthenticationPhonePayload(
          phoneNumber: phone,
          password: password,
          phoneCode: phoneCode,
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
      await _authenticationUsecase.phoneCompletedRegister(payload);
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

  // User? user;

  // void getUserInfo() {
  //   try {
  //     user = _userSharePreferencesUsecase.getUserInfo();
  //     emit(GetProfileSuccess(user));
  //   } catch (error) {
  //     debugPrint("get profile: $error");
  //     emit(GetProfileError(
  //         S.current.messages_server_internal_error.capitalize()));
  //   }
  // }

  User? _currentUser;

  User? get currentUser => _userSharePreferencesUsecase.getUserInfo();

  void setCurrentUser(User? user) => _currentUser = user;

  Future<void> fetchUser() async {
    _currentUser = _userSharePreferencesUsecase.getUserInfo();
    final id = _currentUser?.id;

    if (id != null) {
      try {
        final user = await _userUsecase.geSynctUserById(id);

        if (user != null) {
          await _userSharePreferencesUsecase.saveUserInfo(user);
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
      await _authenticationUsecase.login(payload: payload);

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

  Future resendOTP(AuthenticationPhonePayload payload) async {
    if (state is OnResendOTP) return;
    try {
      emit(OnResendOTP());
      await _authenticationUsecase.registerWithPhone(payload);
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
      await _authenticationUsecase.forgotPassword(payload);
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
      await _authenticationUsecase.forgotPassword(payload);
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
      final response = await _authenticationUsecase.resetPasswordToken(payload);
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
    } on DioException catch (error) {
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

  Future<void> onLogout() async {
    try {
      emit(OnLogout());
      await _authenticationUsecase.logout();
      emit(LogoutSuccess());
    } catch (error) {
      String err = S.current.messages_server_internal_error.capitalize();
      emit(ResetPasswordFail(message: err));
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
      debugPrint("authQrCode: $error");
      String err = S.current.messages_server_internal_error.capitalize();
      emit(LoginQRCodeFail(message: err));
    } catch (error) {
      debugPrint("authQrCode: $error");
      emit(
        LoginQRCodeFail(
          message: S.current.messages_server_internal_error.capitalize(),
        ),
      );
    }
  }
}

enum AuthClaimType { v1, v2 }
