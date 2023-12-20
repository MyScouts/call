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
    @Deprecated('username deprecated.') String? username,
    @Deprecated('name deprecated.') String? name,
    @Deprecated('nickname deprecated.') String? nickname,
    String? email,
    String? phone,
    String? avatar,
    @Deprecated('sex deprecated.') Sex? sex,
    String? phoneCode,
    @Deprecated('address deprecated.') String? address,
    @Deprecated('forgotHash deprecated.') String? forgotHash,
    @Deprecated('status deprecated.') int? status,
    @Deprecated('roleId deprecated.') int? roleId,
    @Deprecated('roleMemberCode deprecated.') String? roleMemberCode,
    @Deprecated('createdById deprecated.') int? createdById,
    @Deprecated('createdAt deprecated.') String? createdAt,
    @Deprecated('updatedAt deprecated.') String? updatedAt,
    @Deprecated('deletedAt deprecated.') String? deletedAt,
    String? pDoneId,
    String? displayName,
    String? fullName,
    @Deprecated('isPDone deprecated.') @Default(false) bool isPDone,
    @Deprecated('isFriend deprecated.') @Default(false) bool isFriend,
    @Deprecated('isFollowing deprecated.') @Default(false) bool isFollowing,
    @Deprecated('isFollowed deprecated.') @Default(false) bool isFollowed,
    @Deprecated('totalFollower deprecated.') @Default(0) int totalFollower,
    @Deprecated('totalFollowing deprecated.') @Default(0) int totalFollowing,
    @Deprecated('totalFriend deprecated.') @Default(0) int totalFriend,
    @Deprecated('old deprecated.') @Default(0) int old,
    @Deprecated('isBlock deprecated.') @Default(false) bool isBlock,
    @Deprecated('backgroundImages deprecated.') List<String>? backgroundImages,
    @Deprecated('defaultBackground deprecated.') String? defaultBackground,
    @Deprecated('isJA deprecated.') bool? isJA,
    @Deprecated('isVShop deprecated.') bool? isVShop,
    @Deprecated('isLive deprecated.') bool? isLive,
    @Deprecated('isSupervisor deprecated.') bool? isSupervisor,
    @Deprecated('isModerator deprecated.') bool? isModerator,
    @Deprecated('joinedTeam deprecated.') Team? joinedTeam,
    DateTime? birthday,
    @Deprecated('jaAt deprecated.') DateTime? jaAt,
    @Deprecated('vShopId deprecated.') String? vShopId,
    @Deprecated('vShopPDoneId deprecated.') int? vShopPDoneId,
    @Deprecated('fanGroup deprecated.') UserFanGroupInfo? fanGroup,
    @Deprecated('profile deprecated.') UserProfileInfo? profile,
    int? sexCode,
    int? type,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

extension UserExtNull on User? {
  String get getDisplayName => this?.displayName ?? _userDefaultName;

  String get getEmail => this?.email ?? _userDefaultEmail;

  @Deprecated('getAddress deprecated.')
  String get getAddress => [this?.address, _userDefaultAddress]
      .firstWhereOrNull((e) => e != null && e.isNotEmpty)!;

  String get getAvatar => this?.avatar ?? Assets.images_avatar.path;

  @Deprecated('getNickname deprecated.')
  String get getNickname => this?.nickname ?? _userDefaultNickname;

  String get getBirthday {
    final DateTime? birthday = this?.birthday;

    return birthday != null ? birthday.toString() : _userDefaultBirthday;
  }

  @Deprecated('fullNameStr deprecated.')
  String get fullNameStr {
    if (this?.fullName != null && this?.fullName?.isNotEmpty == true) {
      return this!.fullName!;
    }
    return this?.displayName?.replaceRange(
            this!.displayName!.length - 3, this!.displayName!.length, '***') ??
        '';
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

  @Deprecated('getIsPDone deprecated.')
  bool get getIsPDone => this?.isPDone ?? false;

  @Deprecated('getIsJA deprecated.')
  bool get getIsJA => this?.isJA ?? false;

  @Deprecated('getIsHasNickname deprecated.')
  bool get getIsHasNickname =>
      this?.nickname != null && this!.nickname!.isNotEmpty;

  bool get getIsHasEmail => this?.email != null && this!.email!.isNotEmpty;

  @Deprecated('User deprecated.')
  bool isUnderFifteen(DateTime? birthDay) {
    if (birthDay == null) {
      return false;
    }

    final int age = calculateAge(birthDay);
    return age < 15;
  }

  String get getPDoneId => this?.pDoneId ?? _userDefaultPDoneId;

  @Deprecated('getSex deprecated.')
  Sex get getSex => this?.sex ?? _userDefaultSex;

  @Deprecated('getTotalFollower deprecated.')
  int get getTotalFollower => this?.totalFollower ?? _userDefaultTotalFollower;

  @Deprecated('getTotalFollowing deprecated.')
  int get getTotalFollowing =>
      this?.totalFollowing ?? _userDefaultTotalFollowing;

  @Deprecated('getTotalFriend deprecated.')
  int get getTotalFriend => this?.totalFriend ?? _userDefaultTotalFriend;

  @Deprecated('getBackgroundImage deprecated.')
  String get getBackgroundImage =>
      this?.backgroundImages?.first ?? _userDefaultBackground;

  @Deprecated('getUserAvatar deprecated.')
  String get getUserAvatar => this?.avatar ?? _userDefaultUserAvatar;

  @Deprecated('getIsPdone deprecated.')
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
