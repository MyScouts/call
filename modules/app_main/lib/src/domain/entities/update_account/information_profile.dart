import 'package:app_main/src/domain/entities/update_account/place/place_information.dart';
import 'package:app_main/src/domain/entities/update_account/upgrade_account.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:app_core/app_core.dart';

part 'information_profile.freezed.dart';
part 'information_profile.g.dart';

@freezed
class InformationProfile with _$InformationProfile {
  @JsonSerializable(explicitToJson: true)
  const factory InformationProfile({
    required String firstName,
    required String middleName,
    required String lastName,
    required String nickName,
    required int sex,
    required DateTime birthday,
    required PlaceInformation birthPlace,
    required PlaceInformation currentPlace,
    required int height,
    required int weight,
    required MaritalStatus maritalStatus,
    required BloodGroup bloodGroup,
    required AcademicLevel academicLevel,
    required Job job,
    required Interest interest,
    required Talent talent,
    required String identityNumber,
    required DateTime supplyDate,
    required String supplyAddress,
    required Protector protector,
    required String protectorPDoneId,
    required String birthCertificateUrl,
    required DateTime birthCertificateSupplyDate,
    required Map<String, dynamic> kycMetadata,
    required Map<String, dynamic> type,
  }) = _InformationProfile;

  factory InformationProfile.fromJson(Map<String, dynamic> json) =>
      _$InformationProfileFromJson(json);
}
