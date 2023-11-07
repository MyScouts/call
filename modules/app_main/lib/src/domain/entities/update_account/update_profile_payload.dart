// ignore_for_file: invalid_annotation_target

import 'package:app_main/src/domain/entities/update_account/update_pdone_birth_place_payload.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'update_place_information_payload.dart';

part 'update_profile_payload.freezed.dart';
part 'update_profile_payload.g.dart';

@freezed
class UpdateProfilePayload with _$UpdateProfilePayload {
  @JsonSerializable(explicitToJson: true)
  const factory UpdateProfilePayload({
    @JsonKey(includeIfNull: false) String? firstName,
    @JsonKey(includeIfNull: false) String? lastName,
    @JsonKey(includeIfNull: false) String? middleName,
    @JsonKey(includeIfNull: false) String? nickname,
    @JsonKey(includeIfNull: false) int? sex,
    @JsonKey(includeIfNull: false) String? birthday,
    @JsonKey(includeIfNull: false) UpdatePDoneBirthPlacePayload? birthPlace,
    @JsonKey(includeIfNull: false) UpdatePlaceInformationPayload? currentPlace,
    @JsonKey(includeIfNull: false) String? identityNumber,
    @JsonKey(includeIfNull: false) String? supplyDate,
    @JsonKey(includeIfNull: false) String? supplyAddress,
    @JsonKey(includeIfNull: false) int? height,
    @JsonKey(includeIfNull: false) int? weight,
    @JsonKey(includeIfNull: false) String? maritalStatus,
    @JsonKey(includeIfNull: false) String? bloodGroup,
    @JsonKey(includeIfNull: false) String? academicLevel,
    @JsonKey(includeIfNull: false) String? job,
    @JsonKey(includeIfNull: false) String? interest,
    @JsonKey(includeIfNull: false) String? talent,
    @JsonKey(includeIfNull: false) int? protector,
    @JsonKey(includeIfNull: false) String? protectorPDoneId,
    @JsonKey(includeIfNull: false) String? protectorIdentityNumber,
    @JsonKey(includeIfNull: false) String? protectorEmailPhone,
    @JsonKey(includeIfNull: false) String? otp,
  }) = _UpdateProfilePayload;

  factory UpdateProfilePayload.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfilePayloadFromJson(json);
}
