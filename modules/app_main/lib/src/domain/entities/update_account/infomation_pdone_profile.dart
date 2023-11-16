import 'package:app_main/src/domain/entities/update_account/place/information_birthplace.dart';
import 'package:app_main/src/domain/entities/update_account/place/information_currentplace.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'infomation_pdone_profile.freezed.dart';
part 'infomation_pdone_profile.g.dart';

@freezed
class InformationPdoneProfile with _$InformationPdoneProfile {
  const factory InformationPdoneProfile({
    required String firstName,
    required String middleName,
    required String lastName,
    required String nickName,
    required int sex,
    required String birthday,
    required InformationPDoneBirthPlace birthPlace,
    required InformationDPoneCurrentPlace currentPlace,
    required int height,
    required int weight,
    required String maritalStatus,
    required String bloodGroup,
    required String academicLevel,
    required String job,
    required String interest,
    required String talent,
    required String identityNumber,
    required String supplyDate,
    required String supplyAddress,
    required int protector,
    required String protectorPDoneId,
    required String birthCertificateUrl,
    required String birthCertificateSupplyDate,
    required Map<String, dynamic> kycMetadata,
    required Map<String, dynamic> type,
  }) = _InformationPdoneProfile;

  factory InformationPdoneProfile.fromJson(Map<String, dynamic> json) => _$InformationPdoneProfileFromJson(json);
}
