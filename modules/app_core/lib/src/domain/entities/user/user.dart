import 'package:collection/collection.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../community/team.dart';
import '../community/user_fan_group_info.dart';
import 'user_profile.dart';

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
    UserProfileInfo? profile,
    int? sexCode,
    int? type,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

extension UserExtNull on User? {
  String get getdisplayName =>
      [this?.displayName, _userDefaultName].firstWhereOrNull((e) => e != null && e.isNotEmpty)!;

  String get getEmail => [this?.email, _userDefaultEmail].firstWhereOrNull((e) => e != null && e.isNotEmpty)!;

  String get getAddress => [this?.address, _userDefaultAddress].firstWhereOrNull((e) => e != null && e.isNotEmpty)!;

  String get getAvatar => this?.avatar ?? Assets.images_avatar.path;

  String get getNickname => this?.nickname ?? _userDefaultNickname;

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

  int get getAge {
    DateTime? birthday;
    if (this?.birthday != null) {
      final age = calculateAge(this!.birthday!);
      return age;
    }
    birthday = this?.profile?.birthday;
    if (birthday == null) {
      return 0;
    }

    final age = calculateAge(birthday);
    return age;
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

  String get getPDoneId => this?.pDoneId ?? _userDefaultPDoneId;

  Sex get getSex => this?.sex ?? _userDefaultSex;

  int get getTotalFollower => this?.totalFollower ?? _userDefaultTotalFollower;

  int get getTotalFollowing => this?.totalFollowing ?? _userDefaultTotalFollowing;

  int get getTotalFriend => this?.totalFriend ?? _userDefaultTotalFriend;

  String get getBackgroundImage => this?.backgroundImages?.first ?? _userDefaultBackground;

  String get getUserAvatar => this?.avatar ?? _userDefaultUserAvatar;

  bool get getIsPdone => this?.isPDone ?? _userIsPDone;
}

const _userDefaultName = 'PDone User';
const _userDefaultEmail = ' ';
const _userDefaultNickname = '';
const _userDefaultBirthday = '01/01/2000';
const _userDefaultAddress = 'default';
const _userDefaultPDoneId = '';
final _userDefaultBackground = ImageConstants.defaultUserBackground;
final _userDefaultUserAvatar = ImageConstants.defaultUserAvatar;
const _userDefaultSex = Sex.male;
const _userDefaultTotalFollower = 0;
const _userDefaultTotalFollowing = 0;
const _userDefaultTotalFriend = 0;
const _userIsPDone = false;

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
        return IconAppConstants.icFeMaleSVG;
      case Sex.male:
        return IconAppConstants.icMaleSVG;
      case Sex.other:
        return IconAppConstants.icLGBTSVG;
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

  Color getTextColor() {
    switch (this) {
      case Sex.other:
      case Sex.female:
        return AppColors.pink12;
      default:
        return AppColors.blueEdit;
    }
  }

  Color getBackgroundColor() {
    switch (this) {
      case Sex.other:
      case Sex.female:
        return AppColors.pink11;
      default:
        return AppColors.blue35;
    }
  }
}
