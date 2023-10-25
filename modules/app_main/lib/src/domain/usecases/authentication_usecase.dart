import 'package:injectable/injectable.dart';

import '../../data/models/payloads/auth/authentication_payload.dart';
import '../../data/models/responses/login_response.dart';
import '../../data/models/responses/register_with_phone_response.dart';
import '../repositories/auth_repository.dart';

@injectable
class AuthenticationUsecase {
  final AuthRepository _authRepository;

  AuthenticationUsecase(
    this._authRepository,
  );

  Future<void> signOut([bool forceLogout = false]) async {
    // _loggerService
    //     .d('[AuthenticationUsecase][signOut] forceLogout: $forceLogout');

    // await _stringeeService.disconnect();

    if (forceLogout == false) {
      // final fcmToken = _userSharePreferencesUsecase.getFCMToken;
      // if (fcmToken?.isNotEmpty ?? false) {
      //   await _notificationUsecase.unregister(fcmToken!);
      // }
      await _authRepository.logout();
    }
    // await _userSharePreferencesUsecase.logout();
  }

  Future<LoginResponse> login({
    required AuthenticationPayload payload,
    required CredentialType type
  }) async {
    // TODO: implement loginWithEmail
    throw UnimplementedError();
  }

  Future<RegisterWithPhoneResponse> registerWithPhone(
      AuthenticationPayload payload) {
    return _authRepository.registerWithPhone(
      countryId: payload.countryId,
      password: payload.password,
      phone: payload.username,
    );
  }
}

enum CredentialType { phone, email }