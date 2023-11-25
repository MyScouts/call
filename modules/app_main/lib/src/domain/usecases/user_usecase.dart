import 'dart:async';

import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/payloads/user/user_action_payload.dart';
import 'package:app_main/src/data/models/responses/search_user_response.dart';
import 'package:app_main/src/data/models/responses/user_action_response.dart';
import 'package:app_main/src/data/models/responses/user_response.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/responses/update_none_pdone_profile_response.dart';
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

  Future deleteUser({
    required int userId,
    required DeleteUserPayload payload,
  }) {
    return _userRepository.deleteUser(userId: userId, payload: payload);
  }

  Future<bool> genOtp() async {
    final isSuccess = await _userRepository.genOtp();
    return isSuccess;
  }

  Future<List<SearchDetail>> searchUser(SearchUserPayload query) async {
    final response = await _userRepository.searchUser(query);
    return response.searchUsers;
  }

  Future<OnboardingResponse> onboarding() {
    return _userRepository.onboarding();
  }

  Future<UpdateNonePDoneProfileReponse> updatePDoneProfile(
      UpdateNonePDoneProfilePayload updateNonePDoneProfilePayload) {
    return _userRepository.updatePDoneProfile(updateNonePDoneProfilePayload);
  }

  Future<UpdateNonePDoneProfileReponse> updateNonePNoneDoneProfile(
      Map<String, dynamic> data) {
    return _userRepository
        .updateNonePDoneProfile(data);
  }

  Future<UpdateNonePDoneProfileReponse> getPDoneProfile() {
    return _userRepository.getPDoneProfile();
  }

  Future<List<User>> listFriends() {
    return _userRepository.listFriends();
  }

  Future invite(String teamID, Map<String, dynamic> json) {
    return _userRepository.invite(teamID, json);
  }

  Future<User> updateEmail(Map<String, dynamic> json) {
    return _userRepository.updateEmail(json);
  }

  Future<bool> genOtpEmail(String email) {
    return _userRepository.genOtpEmail(email);
  }

  Future updateAvatar(String url) {
    return _userRepository.updateAvatar(url);
  }

  Future setConfig(String key, Map<String, dynamic> json) {
    return _userRepository.setConfig(key, json);
  }

  Future<Map<String, dynamic>> getConfig(String key) {
    return _userRepository.getConfig(key);
  }
}
