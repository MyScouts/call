import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/responses/search_user_response.dart';
import 'package:app_main/src/data/models/responses/update_none_pdone_profile_response.dart';
import 'package:app_main/src/data/models/responses/update_pdone_profile_response.dart';
import 'package:app_main/src/data/models/responses/user_action_response.dart';
import 'package:app_main/src/data/models/responses/user_response.dart';

import '../models/payloads/user/user_action_payload.dart';

abstract class UserRepository {
  Future<User?> getProfile();

  Future<User?> getUserById({required int id});

  Future reportUser({
    required int id,
    required ReportUserPayload payload,
  });

  Future<FollowUserResponse> followUser({
    required FollowUserPayload payload,
  });

  Future unFollow({
    required UnFollowPayload payload,
  });

  Future blockUser({required int userId});

  Future deleteUser({
    required int userId,
    required DeleteUserPayload payload,
  });

  Future<bool> genOtp();

  Future<SearchUserResponse> searchUser(SearchUserPayload query);

  Future<OnboardingResponse> onboarding();

  Future<UpdateNonePDoneProfileReponse> updatePDoneProfile(
      UpdateNonePDoneProfilePayload updatePDoneProfilePayload);

  Future<UpdateNonePDoneProfileReponse> updateNonePDoneProfile(
      Map<String, dynamic> data);

  Future<UpdateNonePDoneProfileReponse> getPDoneProfile();

  Future<List<User>> listFriends();

  Future invite(String teamID, Map<String, dynamic> json);
}
