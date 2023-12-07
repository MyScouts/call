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
    bool? hasPendingApproval,
  }) = _GetUserFollowRelationResponse;

  factory GetUserFollowRelationResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUserFollowRelationResponseFromJson(json);
}

@freezed
class ApprovedRequestResponse with _$ApprovedRequestResponse {
  const factory ApprovedRequestResponse({
    required List<ApprovedRequestDetail> approvals,
  }) = _ApprovedRequestResponse;

  factory ApprovedRequestResponse.fromJson(Map<String, dynamic> json) =>
      _$ApprovedRequestResponseFromJson(json);
}

@freezed
class ApprovedRequestDetail with _$ApprovedRequestDetail {
  const factory ApprovedRequestDetail({
    required int id,
    required String createdAt,
    required ApprovedRequestUser? followee,
    required ApprovedRequestUser? follower,
  }) = _ApprovedRequestDetail;

  factory ApprovedRequestDetail.fromJson(Map<String, dynamic> json) =>
      _$ApprovedRequestDetailFromJson(json);
}

@freezed
class ApprovedRequestUser with _$ApprovedRequestUser {
  const factory ApprovedRequestUser({
    required int id,
    required String displayName,
    String? avatar,
    required String pDoneId,
    required String fullName,
    required String birthday,
    required int sexCode,
  }) = _ApprovedRequestUser;

  factory ApprovedRequestUser.fromJson(Map<String, dynamic> json) =>
      _$ApprovedRequestUserFromJson(json);
}
