// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'agency.g.dart';

@JsonSerializable()
class AgencyResponse {
  final int? id;
  final String? name;
  final num? availableCoin;
  final AgencyUser? user;

  AgencyResponse(
      {required this.id,
      required this.name,
      required this.availableCoin,
      required this.user});

  factory AgencyResponse.fromJson(Map<String, dynamic> json) =>
      _$AgencyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AgencyResponseToJson(this);
}

@JsonSerializable()
class AgencyUser {
  final int? id;
  final String? displayName;
  final String? pDoneId;
  final String? email;
  final String? phoneNumber;
  final String? fullName;
  final String? birthday;

  AgencyUser(
      {required this.id,
      required this.displayName,
      required this.phoneNumber,
      required this.email,
      required this.pDoneId,
      required this.fullName,
      required this.birthday});

  factory AgencyUser.fromJson(Map<String, dynamic> json) =>
      _$AgencyUserFromJson(json);
}
