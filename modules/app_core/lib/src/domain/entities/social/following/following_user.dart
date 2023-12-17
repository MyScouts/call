import 'package:design_system/design_system.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'following_user.freezed.dart';

part 'following_user.g.dart';

@freezed
class FollowingUser with _$FollowingUser {
  const factory FollowingUser({
    int? id,
    String? avatar,
    String? displayName,
    String? pDoneId,
    String? fullName,
    String? birthday,
    int? sexCode,
    int? type,
  }) = _FollowingUser;

  factory FollowingUser.fromJson(Map<String, dynamic> json) =>
      _$FollowingUserFromJson(json);
}

extension FollowingUserExtNull on FollowingUser? {
  String get getDisplayName => this?.displayName ?? '';
  String get getPDoneId => this?.pDoneId ?? '';
  String get getAvatar => this?.avatar ?? ImageConstants.defaultUserAvatar;
  int get getType => this?.type ?? 0;
  int get getUserId => this?.id ?? -1;
}
