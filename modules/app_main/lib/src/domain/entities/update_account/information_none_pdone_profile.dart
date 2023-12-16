import 'package:app_main/src/domain/entities/update_account/place/information_birthplace.dart';
import 'package:app_main/src/domain/entities/update_account/place/information_currentplace.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'information_none_pdone_profile.freezed.dart';
part 'information_none_pdone_profile.g.dart';

@freezed
class InformationNonePdoneProfile with _$InformationNonePdoneProfile {
  const factory InformationNonePdoneProfile({
    String? firstName,
    String? middleName,
    String? lastName,
    String? nickName,
    required int sex,
    required String birthday,
    InformationPDoneBirthPlace? birthPlace,
    InformationDPoneCurrentPlace? currentPlace,
    int? height,
    int? weight,
    String? maritalStatus,
    String? bloodGroup,
    String? academicLevel,
    String? job,
    String? interest,
    String? talent,
    String? identityNumber,
    String? supplyDate,
    String? supplyAddress,
    int? protector,
    String? protectorPDoneId,
    String? birthCertificateUrl,
    String? birthCertificateSupplyDate,
    Map<String, dynamic>? kycMetadata,
    int? type,
  }) = _InformationNonePdoneProfile;

  factory InformationNonePdoneProfile.fromJson(Map<String, dynamic> json) =>
      _$InformationNonePdoneProfileFromJson(json);
}
