import 'package:freezed_annotation/freezed_annotation.dart';

part 'pdone_information_response.g.dart';

@JsonSerializable()
class PDoneInformationResponse {
  final PDoneInformationData profile;

  PDoneInformationResponse({
    required this.profile,
  });

  factory PDoneInformationResponse.fromJson(Map<String, dynamic> json) =>
      _$PDoneInformationResponseFromJson(json);
}

@JsonSerializable()
class PDoneInformationData {
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final int? sex;
  final String? birthday;
  final String? identityNumber;
  final String? supplyDate;
  final int? type;
  final int? height;
  final int? weight;
  final String? maritalStatus;
  final String? bloodGroup;
  final String? academicLevel;
  final String? job;
  final String? interest;
  final String? talent;
  final LocationData? birthPlace;
  final LocationData? currentPlace;
  final int? protector;
  final String? protectorPDoneId;
  final String? birthCertificateUrl;

  PDoneInformationData({
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.sex,
    required this.birthday,
    required this.identityNumber,
    required this.supplyDate,
    required this.type,
    this.academicLevel,
    this.bloodGroup,
    this.height,
    this.interest,
    this.job,
    this.maritalStatus,
    this.talent,
    this.weight,
    this.birthPlace,
    this.currentPlace,
    this.birthCertificateUrl,
    this.protector,
    this.protectorPDoneId,
  });

  factory PDoneInformationData.fromJson(Map<String, dynamic> json) =>
      _$PDoneInformationDataFromJson(json);
}

@JsonSerializable()
class LocationData {
  final int? countryId;
  final int? provinceId;
  final int? districtId;
  final int? wardId;
  final String? countryName;
  final String? provinceName;
  final String? districtName;
  final String? wardName;
  final String? street;
  final String? address;
  final String? countryCode;
  final String? provinceCode;
  final String? districtCode;
  final String? wardCode;

  LocationData({
    this.countryId,
    this.districtId,
    this.provinceId,
    this.wardId,
    this.address,
    this.countryCode,
    this.countryName,
    this.districtCode,
    this.districtName,
    this.provinceCode,
    this.provinceName,
    this.street,
    this.wardCode,
    this.wardName,
  });

  factory LocationData.fromJson(Map<String, dynamic> json) =>
      _$LocationDataFromJson(json);
}
