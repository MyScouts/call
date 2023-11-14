import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/data_sources/remote/user_api.dart';
import 'package:app_main/src/data/models/payloads/user/user_action_payload.dart';
import 'package:app_main/src/data/models/responses/search_user_response.dart';
import 'package:app_main/src/data/models/responses/update_none_pdone_profile_response.dart';
import 'package:app_main/src/data/models/responses/update_pdone_profile_response.dart';
import 'package:app_main/src/data/models/responses/user_action_response.dart';
import 'package:app_main/src/data/models/responses/user_response.dart';
import 'package:app_main/src/data/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UserRepository)
class AuthRepositoryImpl extends UserRepository {
  final UserApi _userAPI;

  AuthRepositoryImpl(
    this._userAPI,
  );

  @override
  Future<User?> getProfile() async {
    final res = await _userAPI.getProfile();
    return res.data;
  }

  @override
  Future<User?> getUserById({required int id}) async {
    final res = await _userAPI.getUserById(id: id);

    return res.data;
  }

  @override
  Future reportUser({required int id, required ReportUserPayload payload}) {
    return _userAPI.reportUser(id: id, body: payload);
  }

  @override
  Future<FollowUserResponse> followUser({
    required FollowUserPayload payload,
  }) async {
    final res = await _userAPI.followUser(body: payload);
    return res.data;
  }

  @override
  Future unFollow({required UnFollowPayload payload}) {
    return _userAPI.unFollow(body: payload);
  }

  @override
  Future blockUser({required int userId}) {
    return _userAPI.blockUser(userId);
  }

  @override
  Future deleteUser({required int userId, required DeleteUserPayload payload}) {
    return _userAPI.deleteById(id: userId, payload: payload);
  }

  @override
  Future<bool> genOtp() async {
    await _userAPI.genOTP();
    return true;
  }

  @override
  Future<SearchUserResponse> searchUser(SearchUserPayload query) {
    return _userAPI.searchUser(query);
  }

  @override
  Future<OnboardingResponse> onboarding() {
    return _userAPI.onboarding();
  }

  @override
  Future<UpdatePDoneProfileReponse> updatePDoneProfile(UpdatePDoneProfilePayload updatePDoneProfilePayload) {
    return _userAPI.updatePDoneProfile(updatePDoneProfilePayload);
  }

  @override
  Future<UpdateNonePDoneProfileReponse> updateNonePDoneProfile(
      UpdateNonePDoneProfilePayload updateNonePDoneProfilePayload) {
    return _userAPI.updateNonePDoneProfile(updateNonePDoneProfilePayload);
  }

  @override
  Future<UpdateNonePDoneProfileReponse> getPDoneProfile() {
    return _userAPI.getPDoneProfile();
  }
}
