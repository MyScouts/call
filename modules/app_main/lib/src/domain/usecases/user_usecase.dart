import 'dart:async';

import 'package:app_core/app_core.dart';
import 'package:injectable/injectable.dart';

import '../../data/repositories/user_repository.dart';

@injectable
class UserUsecase {
  final UserRepository _userRepository;

  UserUsecase(
    this._userRepository,
  );

  Future<User?> geSynctUserById(int id) async {
    final user = await _userRepository.getUserById(id: id);
    // unawaited(_chatUsecase.updateUserInfo(user));

    return user;
  }
}
