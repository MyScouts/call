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

  PDoneInformationData({
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.sex,
    required this.birthday,
    required this.identityNumber,
    required this.supplyDate,
    required this.type,
  });

  factory PDoneInformationData.fromJson(Map<String, dynamic> json) =>
      _$PDoneInformationDataFromJson(json);
}
