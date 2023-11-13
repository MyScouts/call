import 'package:collection/collection.dart';
import 'package:design_system/design_system.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../community/team.dart';
import '../community/user_fan_group_info.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    int? id,
    String? username,
    String? name,
    String? nickname,
    String? email,
    String? phone,
    String? avatar,
    Sex? sex,
    String? phoneCode,
    String? address,
    String? forgotHash,
    int? status,
    int? roleId,
    String? roleMemberCode,
    int? createdById,
    String? createdAt,
    String? updatedAt,
    String? deletedAt,
    String? pDoneId,
    String? displayName,
    bool? isPDone,
    bool? isFriend,
    bool? isFollowing,
    bool? isFollowed,
    @Default(0) int totalFollower,
    @Default(0) int totalFollowing,
    @Default(0) int totalFriend,
    @Default(0) int old,
    @Default(false) bool isBlock,
    List<String>? backgroundImages,
    String? defaultBackground,
    bool? isJA,
    bool? isVShop,
    bool? isLive,
    bool? isSupervisor,
    bool? isModerator,
    Team? joinedTeam,
    DateTime? birthday,
    DateTime? jaAt,
    String? vShopId,
    int? vShopPDoneId,
    UserFanGroupInfo? fanGroup,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

extension UserExtNull on User? {
  String get getdisplayName => [this?.displayName, _userDefaultName]
      .firstWhereOrNull((e) => e != null && e.isNotEmpty)!;
  bool get getIsPDone => this?.isPDone ?? false;
}

const _userDefaultName = null;

extension UserExtension on User {
  Role role(int? hostUserID) {
    if (id == hostUserID) {
      return Role.host;
    }
    if (isModerator == true) {
      return Role.moderator;
    }
    if (isSupervisor == true) {
      return Role.supervisor;
    }
    return Role.viewer;
  }
}

enum Role { viewer, host, moderator, supervisor }

int calculateAge(DateTime birthDate) {
  final currentDate = DateTime.now();
  int age = currentDate.year - birthDate.year;
  final month1 = currentDate.month;
  final month2 = birthDate.month;
  if (month2 > month1) {
    age--;
  } else if (month1 == month2) {
    final day1 = currentDate.day;
    final day2 = birthDate.day;
    if (day2 > day1) {
      age--;
    }
  }
  return age;
}

enum Sex {
  @JsonValue('Nam')
  male('Nam'),
  @JsonValue('Nữ')
  female('Nữ'),
  @JsonValue('Khác')
  other('Khác'),
  @JsonValue('Không xác định`')
  unknown('Không xác định`'),
  ;

  final String title;

  const Sex(this.title);
}

extension SexExt on Sex {
  String getIcon() {
    switch (this) {
      case Sex.female:
        return IconAppConstants.icFemale;
      case Sex.male:
        return IconAppConstants.icMale;
      default:
        return IconAppConstants.icMale;
    }
  }
}
