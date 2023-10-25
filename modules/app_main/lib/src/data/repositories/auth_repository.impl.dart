import 'package:injectable/injectable.dart';

import '../../domain/repositories/auth_repository.dart';
import '../data_sources/remote/auth_api.dart';
import '../models/responses/login_response.dart';
import '../models/responses/register_with_phone_response.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final AuthApi _authApi;

  AuthRepositoryImpl(
    this._authApi,
  );

  @override
  Future<LoginResponse> loginWithPhone(
      String phone, String password, int countryId) {
    // TODO: implement loginWithPhone
    throw UnimplementedError();
  }

  @override
  Future<RegisterWithPhoneResponse> registerWithPhone({
    required String phone,
    required String password,
    required int countryId,
  }) {
    // TODO: implement registerWithPhone
    throw UnimplementedError();
  }

  @override
  Future<bool> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
