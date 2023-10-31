// ignore_for_file: depend_on_referenced_packages

import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/payloads/auth/authentication_phone_payload.dart';
import 'package:app_main/src/domain/entities/update_account/otp/otp.dart';
import 'package:app_main/src/domain/usecases/authentication_usecase.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:localization/localization.dart';

import '../../domain/usecases/user_share_preferences_usecase.dart';

part 'user_state.dart';

@injectable
class UserCubit extends Cubit<UserState> {
  final AuthenticationUsecase _authenticationUsecase;
  final UserSharePreferencesUsecase _userSharePreferencesUsecase;

  UserCubit(
    this._authenticationUsecase,
    this._userSharePreferencesUsecase,
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
        case "USER_EXISTED":
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

  Future phoneLogin(AuthenticationPhonePayload payload) async {
    if (state is OnPhoneLogin) return;
    try {
      emit(OnPhoneLogin());
      await _authenticationUsecase.login(payload: payload);
      emit(PhoneLoginSuccess());
    } on DioException catch (error) {
      final data = error.response!.data;
      debugPrint("phoneRegister: $error");
      String err = S.current.messages_server_internal_error.capitalize();
      switch (data['code']) {
        case "INVALID_PASSWORD":
          err = S.current.message_password_invalid.capitalize();
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
}
