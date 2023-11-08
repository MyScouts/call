import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_user_response.freezed.dart';
part 'search_user_response.g.dart';

@freezed
class SearchUserResponse with _$SearchUserResponse {
  const factory SearchUserResponse({
    required List<SearchUser> searchUsers,
  }) = _SearchUserResponse;

  factory SearchUserResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchUserResponseFromJson(json);
}

@freezed
class SearchUser with _$SearchUser {
  const factory SearchUser({
    required int id,
    required String displayName,
    String? fullName,
    required String pDoneId,
    String? birthday,
  }) = _SearchUser;

  factory SearchUser.fromJson(Map<String, dynamic> json) =>
      _$SearchUserFromJson(json);
}
