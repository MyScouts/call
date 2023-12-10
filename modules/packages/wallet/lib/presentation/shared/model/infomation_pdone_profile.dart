import 'package:freezed_annotation/freezed_annotation.dart';

part 'infomation_pdone_profile.freezed.dart';

part 'infomation_pdone_profile.g.dart';

@freezed
class PDoneProfile with _$PDoneProfile {
  const factory PDoneProfile({
    String? firstName,
    String? middleName,
    String? lastName,
    String? nickName,
    int? sex,
    String? identityNumber,
    String? birthday,
    // required int height,
    // required int weight,
    // required String maritalStatus,
    // required String bloodGroup,
    // required String academicLevel,
    // required String job,
    // required String interest,
    // required String talent,
    // required String supplyDate,
    // required String supplyAddress,
    // required int protector,
    // required String protectorPDoneId,
    // required String birthCertificateUrl,
    // required String birthCertificateSupplyDate,
    // required Map<String, dynamic> kycMetadata,
    // required Map<String, dynamic> type,
  }) = _PDoneProfile;

  factory PDoneProfile.fromJson(Map<String, dynamic> json) =>
      _$PDoneProfileFromJson(json);
}
