import '../../data/models/responses/login_response.dart';
import '../../data/models/responses/register_with_phone_response.dart';

abstract class AuthRepository {
  /// Login
  Future<LoginResponse> loginWithPhone(
      String phone, String password, int countryId);

  Future<RegisterWithPhoneResponse> registerWithPhone({
    required String phone,
    required String password,
    required int countryId,
  });

  /// Logout
  Future<bool> logout();
}