import 'package:app_main/src/data/models/payloads/auth/authentication_phone_payload.dart';

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
  });

  Future<PhoneCompleteRegister> completeRegister(
    CompletedPhoneRegisterPayload payload,
  );

  /// Logout
  Future<bool> logout();

  Future<Otp> getOtp();
}
