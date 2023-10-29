// Copyright 2022 Fighttech.vn, Ltd. All rights reserved.
// ignore_for_file: invalid_annotation_target
import 'package:app_core/app_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'place/place_information.dart';
import 'upgrade_account.dart';

part 'pdone_profile.freezed.dart';
part 'pdone_profile.g.dart';

@freezed
class PDoneProfile with _$PDoneProfile {
  @JsonSerializable(explicitToJson: true)
  const factory PDoneProfile({
    PlaceInformation? birthPlace,
    PlaceInformation? currentPlace,
    int? id,
    int? userId,
    String? firstName,
    String? middleName,
    String? lastName,
    String? nickname,
    Gender? sex,
    DateTime? birthday,
    Protector? protector,
    String? protectorPDoneId,
    String? identityNumber,
    DateTime? supplyDate,
    String? supplyAddress,
    int? height,
    int? weight,
    BloodGroup? bloodGroup,
    MaritalStatus? maritalStatus,
    AcademicLevel? academicLevel,
    Job? job,
    Interest? interest,
    Talent? talent,
    User? protectorInfo,
  }) = _PDoneProfile;

  factory PDoneProfile.fromJson(Map<String, dynamic> json) =>
      _$PDoneProfileFromJson(json);
}

extension PDoneProfileExtNull on PDoneProfile? {
  String? get displayGender {
    if (this?.sex == null) {
      return null;
    }
    return this?.sex?.value;
  }

  String? get displayHeight {
    if (this?.height == null) {
      return null;
    }

    return '${this?.height} cm';
  }

  String? get displayWeight {
    if (this?.weight == null) {
      return null;
    }

    return '${this?.weight} kg';
  }

  String? get displayBloodGroup {
    if (this?.bloodGroup == null) {
      return null;
    }

    return this?.bloodGroup?.name;
  }

  String? get displayMaritalStatus {
    if (this?.maritalStatus == null) {
      return null;
    }

    return this?.maritalStatus?.name;
  }

  String? get displayAcademicLevel {
    if (this?.academicLevel == null) {
      return null;
    }

    return this?.academicLevel?.name;
  }

  String? get displayJob {
    if (this?.job == null) {
      return null;
    }

    return this?.job?.name;
  }

  String? get displayInterest {
    if (this?.interest == null) {
      return null;
    }

    return this?.interest?.name;
  }

  String? get displayTalent {
    if (this?.talent == null) {
      return null;
    }

    return this?.talent?.name;
  }

  String get displayFullName {
    return '${this?.firstName ?? ''} '
            '${this?.middleName ?? ''} ${this?.lastName ?? ''}'
        .trim();
  }
}
