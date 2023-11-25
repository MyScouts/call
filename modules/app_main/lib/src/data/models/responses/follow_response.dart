import 'package:freezed_annotation/freezed_annotation.dart';

part 'follow_response.freezed.dart';
part 'follow_response.g.dart';

@freezed
class GetUserFollowDetailResponse with _$GetUserFollowDetailResponse {
  const factory GetUserFollowDetailResponse({
    required GetUserFollowStartResponse stats,
    required GetUserFollowRelationResponse relation,
  }) = _GetUserFollowDetailResponse;

  factory GetUserFollowDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUserFollowDetailResponseFromJson(json);
}

@freezed
class GetUserFollowStartResponse with _$GetUserFollowStartResponse {
  const factory GetUserFollowStartResponse({
    required int friendCount,
    required int followerCount,
    required int followeeCount,
  }) = _GetUserFollowStartResponse;

  factory GetUserFollowStartResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUserFollowStartResponseFromJson(json);
}

@freezed
class GetUserFollowRelationResponse with _$GetUserFollowRelationResponse {
  const factory GetUserFollowRelationResponse({
    required bool isFriend,
    required bool isFollower,
    required bool isFollowee,
  }) = _GetUserFollowRelationResponse;

  factory GetUserFollowRelationResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUserFollowRelationResponseFromJson(json);
}
