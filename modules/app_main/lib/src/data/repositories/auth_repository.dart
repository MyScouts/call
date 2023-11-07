import 'package:app_main/src/data/models/payloads/auth/authentication_payload.dart';
import 'package:app_main/src/data/models/payloads/auth/authentication_phone_payload.dart';
import 'package:app_main/src/domain/entities/change_password_payload.dart';

import '../../domain/entities/update_account/otp/otp.dart';
import '../models/responses/authenticate_response.dart';

abstract class AuthRepository {
  /// Login
  Future<LoginResponse> loginWithPhone(
    AuthenticationPhonePayload payload,
  );

  Future registerWithPhone({
    required String phone,
    required String password,
    required String phoneCode,
    required String birthDate,
    required int sex,
  });

  Future<PhoneCompleteRegister> completeRegister(
    CompletedPhoneRegisterPayload payload,
  );

  /// Logout
  Future<bool> logout();

  /// Forgot password
  Future forgotPassword(ForgotPasswordPayload payload);
  Future<ResetPasswordTokenResponse> resetPasswordToken(
    ResetPasswordTokenPayload payload,
  );
  Future<ResetPasswordResponse> resetPassword(ResetPasswordPayload payload);
  Future otp();

  Future<Otp> getOtp();

  Future authClaimV1(AuthClaimPayload payload);
  Future authClaimV2(AuthClaimPayload payload);

  Future changePassword(ChangePasswordPayload payload);
}
