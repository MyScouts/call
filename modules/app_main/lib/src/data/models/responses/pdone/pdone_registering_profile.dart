import 'package:json_annotation/json_annotation.dart';

part 'pdone_registering_profile.g.dart';

@JsonSerializable()
class PDoneRegisteringProfileResponse {
  final PDoneRegisteringProfileData? registeringProfile;

  PDoneRegisteringProfileResponse({
    required this.registeringProfile,
  });

  factory PDoneRegisteringProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$PDoneRegisteringProfileResponseFromJson(json);
}

@JsonSerializable()
class PDoneRegisteringProfileData {
  final String id;
  final String firstName;
  final String middleName;
  final String lastName;
  final int sex;
  final int protector;
  final String protectorPDoneId;
  final String birthCertificateUrl;
  final int type;
  final int registeringStatus;
  final String birthday;

  PDoneRegisteringProfileData(
      {required this.protector,
      required this.id,
      required this.type,
      required this.birthCertificateUrl,
      required this.birthday,
      required this.firstName,
      required this.lastName,
      required this.middleName,
      required this.protectorPDoneId,
      required this.registeringStatus,
      required this.sex});

  factory PDoneRegisteringProfileData.fromJson(Map<String, dynamic> json) =>
      _$PDoneRegisteringProfileDataFromJson(json);
}
