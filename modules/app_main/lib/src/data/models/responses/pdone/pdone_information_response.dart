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

  Map<String, dynamic> toJson() => _$PDoneInformationResponseToJson(this);
}

@JsonSerializable()
class PDoneInformationData {
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final int? sex;
  final String? birthday;
  final String? identityNumber;
  final Place? birthPlace;
  final Place? currentPlace;
  final String? supplyDate;
  final String? supplyAddress;
  final int? type;
  final int? height;
  final int? weight;
  final String? maritalStatus;
  final String? bloodGroup;
  final String? academicLevel;
  final String? job;
  final String? interest;
  final String? talent;
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
    required this.supplyAddress,
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

  Map<String, dynamic> toJson() => _$PDoneInformationDataToJson(this);

  String get fullName => '$firstName $middleName $lastName';
}

@JsonSerializable()
class Place {
  final String countryName;
  final String provinceName;
  final String districtName;
  final String wardName;
  final String street;
  final String address;
  final String countryCode;
  final int countryId;
  final int provinceId;
  final int districtId;
  final int wardId;
  final String provinceCode;
  final String districtCode;
  final String wardCode;

  Place({
    this.countryName = '',
    this.provinceName = '',
    this.districtName = '',
    this.wardName = '',
    this.street = '',
    this.address = '',
    this.countryCode = '',
    this.countryId = 0,
    this.provinceId = 0,
    this.districtId = 0,
    this.wardId = 0,
    this.districtCode = '',
    this.provinceCode = '',
    this.wardCode = '',
  });

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);

  String get fullAddress {
    String res = '';
    if (address.isNotEmpty) res += '$address, ';
    if (street.isNotEmpty) res += '$street, ';
    if (wardName.isNotEmpty) res += '$wardName, ';
    if (districtName.isNotEmpty) res += '$districtName, ';
    if (provinceName.isNotEmpty) res += '$provinceName, ';
    if (countryName.isNotEmpty) res += countryName;
    return res;
  }
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
