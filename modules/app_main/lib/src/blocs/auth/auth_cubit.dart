import 'package:app_core/app_core.dart';
import 'package:app_main/src/domain/usecases/authentication_usecase.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:localization/localization.dart';

part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final AuthenticationUsecase _authenticationUsecase;
  AuthCubit(this._authenticationUsecase) : super(AuthInitial());

  Future sendOTP() async {
    if (state is OnSendOTP) return;
    try {
      emit(OnSendOTP());
      await _authenticationUsecase.otpV1();
      emit(SendOTPSuccess());
    } catch (e) {
      String err = S.current.messages_server_internal_error.capitalize();
      emit(SendOTPFail(message: err));
    }
  }

  Future resendOTP() async {
    if (state is OnResendOTP) return;
    try {
      emit(OnResendOTP());
      await _authenticationUsecase.otpV1();
      emit(ResendOTPSuccess());
    } catch (e) {
      String err = S.current.messages_server_internal_error.capitalize();
      emit(ResendOTPFail(message: err));
    }
  }

  Future autoLogin() async {
    _authenticationUsecase.syncUser();
  }
}
