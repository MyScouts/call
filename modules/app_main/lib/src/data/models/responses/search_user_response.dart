import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_user_response.freezed.dart';
part 'search_user_response.g.dart';

@freezed
class SearchUserResponse with _$SearchUserResponse {
  const factory SearchUserResponse({
    required List<SearchDetail> searchUsers,
  }) = _SearchUserResponse;

  factory SearchUserResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchUserResponseFromJson(json);
}

@freezed
class SearchDetail with _$SearchDetail {
  const factory SearchDetail({
    required SearchUser user,
  }) = _SearchDetail;

  factory SearchDetail.fromJson(Map<String, dynamic> json) =>
      _$SearchDetailFromJson(json);
}

@freezed
class SearchUser with _$SearchUser {
  const factory SearchUser({
    required int id,
    required String displayName,
    String? fullName,
    String? pDoneId,
    String? birthday,
  }) = _SearchUser;

  factory SearchUser.fromJson(Map<String, dynamic> json) =>
      _$SearchUserFromJson(json);
}
