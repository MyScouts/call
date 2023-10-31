// Copyright 2022 Fighttech.vn, Ltd. All rights reserved.
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'upgrade_account.freezed.dart';
part 'upgrade_account.g.dart';

@freezed
class UpgradeAccount with _$UpgradeAccount {
  const factory UpgradeAccount({
    List<Job>? jobs,
    @JsonKey(name: 'sex') List<Gender>? genders,
    List<Protector>? protectors,
    @JsonKey(name: 'blood_groups') List<BloodGroup>? bloodGroups,
    @JsonKey(name: 'marital_status') List<MaritalStatus>? maritalStatus,
    @JsonKey(name: 'academic_levels') List<AcademicLevel>? academicLevels,
    List<Interest>? interests,
    List<Talent>? talents,
  }) = _UpgradeAccount;

  factory UpgradeAccount.fromJson(Map<String, dynamic> json) =>
      _$UpgradeAccountFromJson(json);
}

@freezed
class Job with _$Job {
  const factory Job({
    String? key,
    String? name,
  }) = _Job;

  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);
}

@freezed
class Gender with _$Gender {
  const factory Gender({
    int? key,
    String? value,
  }) = _Gender;

  factory Gender.fromJson(Map<String, dynamic> json) => _$GenderFromJson(json);
}

@freezed
class Protector with _$Protector {
  const factory Protector({
    int? id,
    String? name,
  }) = _Protector;

  factory Protector.fromJson(Map<String, dynamic> json) =>
      _$ProtectorFromJson(json);
}

@freezed
class BloodGroup with _$BloodGroup {
  const factory BloodGroup({
    String? id,
    String? name,
  }) = _BloodGroup;

  factory BloodGroup.fromJson(Map<String, dynamic> json) =>
      _$BloodGroupFromJson(json);
}

@freezed
class MaritalStatus with _$MaritalStatus {
  const factory MaritalStatus({
    String? key,
    String? name,
  }) = _MaritalStatus;

  factory MaritalStatus.fromJson(Map<String, dynamic> json) =>
      _$MaritalStatusFromJson(json);
}

@freezed
class AcademicLevel with _$AcademicLevel {
  const factory AcademicLevel({
    String? key,
    String? name,
  }) = _AcademicLevel;

  factory AcademicLevel.fromJson(Map<String, dynamic> json) =>
      _$AcademicLevelFromJson(json);
}

@freezed
class Interest with _$Interest {
  const factory Interest({
    String? key,
    String? name,
  }) = _Interest;

  factory Interest.fromJson(Map<String, dynamic> json) =>
      _$InterestFromJson(json);
}

@freezed
class Talent with _$Talent {
  const factory Talent({
    String? key,
    String? name,
  }) = _Talent;

  factory Talent.fromJson(Map<String, dynamic> json) => _$TalentFromJson(json);
}
