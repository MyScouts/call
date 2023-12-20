import 'dart:async';

import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/payloads/user/user_action_payload.dart';
import 'package:app_main/src/data/models/responses/follow_response.dart';
import 'package:app_main/src/data/models/responses/search_user_response.dart';
import 'package:app_main/src/data/models/responses/user_action_response.dart';
import 'package:app_main/src/domain/usecases/user_share_preferences_usecase.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/responses/list_followees_response.dart';
import '../../data/models/responses/update_none_pdone_profile_response.dart';
import '../../data/repositories/user_repository.dart';

@injectable
class UserUsecase {
  final UserRepository _userRepository;
  final UserSharePreferencesUsecase _userSharePreferencesUsecase;

  UserUsecase(
    this._userRepository,
    this._userSharePreferencesUsecase,
  );

  Future<User?> geSynctUserById(int id) async {
    final user = await _userRepository.getUserById(id: id);
    return user;
  }

  Future<User?> getUserPublicInfo(int id) async {
    final user = await _userRepository.getUserPublicInfo(id: id);
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

  Future<OnBoarding> onboarding() async {
    final response = await _userRepository.onboarding();
    final onboarding = OnBoarding(
      isJA: response.isJA,
      isPdone: response.isPdone,
      isMarshopOwner: response.isMarshopOwner,
      isMarshopCustomer: response.isMarshopCustomer,
      hasDefaultBankAccount: response.hasDefaultBankAccount,
      marshopCustomerId: response.marshopCustomerId,
    );
    unawaited(_userSharePreferencesUsecase.saveOnboarding(onboarding));
    return onboarding;
  }

  Future<UpdateNonePDoneProfileReponse> updatePDoneProfile(
      UpdateNonePDoneProfilePayload updateNonePDoneProfilePayload) {
    return _userRepository.updatePDoneProfile(updateNonePDoneProfilePayload);
  }

  Future<UpdateNonePDoneProfileReponse> updateNonePNoneDoneProfile(
      Map<String, dynamic> data) {
    return _userRepository.updateNonePDoneProfile(data);
  }

  Future<UpdateNonePDoneProfileReponse> getPDoneProfile() {
    return _userRepository.getPDoneProfile();
  }

  Future<List<User>> listFriends() {
    return _userRepository.listFriends();
  }

  Future<List<User>> listFollower() {
    return _userRepository.listFollower();
  }

  Future<List<FolloweesUser>> listFollowees() {
    return _userRepository.listFollowees();
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

  Future<GetUserFollowDetailResponse> getFollowUser(int userId) {
    return _userRepository.getFollowUser(userId);
  }

  Future<List<ApprovedRequestDetail>> approvedRequests() async {
    final response = await _userRepository.approvedRequests();
    return response.approvals;
  }

  Future replyFollow(ReplyFollowPayload payload) {
    return _userRepository.replyFollowRequest(payload);
  }

  Future<UserInfo> getMe() {
    return _userRepository.getMe();
  }
}
