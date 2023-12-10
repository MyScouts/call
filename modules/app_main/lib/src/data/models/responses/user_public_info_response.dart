import 'package:app_core/app_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_public_info_response.freezed.dart';

part 'user_public_info_response.g.dart';

@freezed
class UserPublicInfoResponse with _$UserPublicInfoResponse {
  const factory UserPublicInfoResponse({
    User? user,
  }) = _UserPublicInfoResponse;

  factory UserPublicInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$UserPublicInfoResponseFromJson(json);
}
