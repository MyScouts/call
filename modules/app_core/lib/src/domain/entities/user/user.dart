import 'package:collection/collection.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../community/team.dart';
import '../community/user_fan_group_info.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@freezed
class User with _$User {
  const factory User(
      {int? id,
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
      String? fullName,
      @Default(false) bool isPDone,
      @Default(false) bool isFriend,
      @Default(false) bool isFollowing,
      @Default(false) bool isFollowed,
      @Default(0) int totalFollower,
      @Default(0) int totalFollowing,
      @Default(0) int totalFriend,
      @Default(0) int old,
      @Default(false) bool isBlock,
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
      int? sexCode}) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

extension UserExtNull on User? {
  String get getdisplayName =>
      [this?.displayName, _userDefaultName].firstWhereOrNull((e) => e != null && e.isNotEmpty)!;

  String get getEmail => [this?.email, _userDefaultEmail].firstWhereOrNull((e) => e != null && e.isNotEmpty)!;

  String get getAddress => [this?.address, _userDefaultAddress].firstWhereOrNull((e) => e != null && e.isNotEmpty)!;

  String get getNickname => [this?.nickname, _userDefaultNickname].firstWhereOrNull((e) => e != null && e.isNotEmpty)!;

  String get getBirthday {
    final DateTime? birthday = this?.birthday;

    return birthday != null ? birthday.toString() : _userDefaultBirthday;
  }

  String get fullNameStr {
    if (this?.fullName != null && this?.fullName?.isNotEmpty == true) {
      return this!.fullName!;
    }
    return this?.displayName?.replaceRange(this!.displayName!.length - 3, this!.displayName!.length, '***') ?? '';
  }

  bool get getIsPDone => this?.isPDone ?? false;

  bool get getIsJA => this?.isJA ?? false;

  bool get getIsHasNickname => this?.nickname != null && this!.nickname!.isNotEmpty;

  bool get getIsHasEmail => this?.email != null && this!.email!.isNotEmpty;

  bool isUnderFifteen(DateTime? birthDay) {
    if (birthDay == null) {
      return false;
    }

    final int age = calculateAge(birthDay);
    return age < 15;
  }
}

const _userDefaultName = 'PDone User';
const _userDefaultEmail = 'pdoneuser@gmail.com';
const _userDefaultNickname = 'PDone';
const _userDefaultBirthday = '01-01-2000';
const _userDefaultAddress = 'default';

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

  Sex get sexCodeValue {
    switch (sexCode) {
      case 1:
        return Sex.male;
      default:
        return Sex.female;
    }
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

  String getIcon1() {
    switch (this) {
      case Sex.female:
        return IconAppConstants.icFeMaleSVG;
      case Sex.male:
        return IconAppConstants.icMaleSVG;
      default:
        return IconAppConstants.icMaleSVG;
    }
  }

  Color get sexBackGroundColor {
    switch (this) {
      case Sex.female:
        return const Color(0XFFFFEDF8);
      case Sex.male:
        return const Color(0XFF79B6EF);
      default:
        return const Color(0XFF79B6EF);
    }
  }

  Color get sexColor {
    switch (this) {
      case Sex.female:
        return const Color(0XFFE495DA);
      case Sex.male:
        return Colors.white;
      default:
        return const Color(0XFF79B6EF);
    }
  }
}
