import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_action_response.freezed.dart';
part 'user_action_response.g.dart';

@freezed
class FollowUserResponse with _$FollowUserResponse {
  const factory FollowUserResponse({
    bool? isFriend,
    required bool approvalRequired,
  }) = _FollowUserResponse;

  factory FollowUserResponse.fromJson(Map<String, dynamic> json) =>
      _$FollowUserResponseFromJson(json);
}
