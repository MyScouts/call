import 'dart:async';

import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/payloads/user/user_action_payload.dart';
import 'package:app_main/src/data/models/responses/user_action_response.dart';
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

  Future<User?> getProfile() async {
    final user = await _userRepository.getProfile();
    return user;
  }

  Future reportUser({
    required int userId,
    required ReportUserPayload payload,
  }) async {
    return _userRepository.reportUser(id: userId, payload: payload);
  }

  Future<FollowUserResponse> followUser({
    required FollowUserPayload payload,
  }) async {
    return _userRepository.followUser(payload: payload);
  }

  Future unFollow({
    required UnFollowPayload payload,
  }) async {
    return _userRepository.unFollow(payload: payload);
  }

  Future blockUser({required int userId}) async {
    return _userRepository.blockUser(userId: userId);
  }
}
