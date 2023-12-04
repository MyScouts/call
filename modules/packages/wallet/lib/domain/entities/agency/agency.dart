// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wallet/data/datasources/models/exchange_coin_response.dart';

import '../wallet/bank_account.dart';

part 'agency.g.dart';

@JsonSerializable()
class AgencyDetailResponse {
  final AgencyResponse coinAgency;
  final List<BankAccount>? bankAccounts;

  AgencyDetailResponse({
    required this.coinAgency,
    required this.bankAccounts,
  });

  factory AgencyDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$AgencyDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AgencyDetailResponseToJson(this);
}

@JsonSerializable()
class AgencyResponse {
  final int? id;
  final String? name;
  final num? availableCoin;
  final AgencyUser? user;
  final List<CoinDiscountResponse>? coinDiscounts;

  AgencyResponse(
      {required this.id,
      required this.coinDiscounts,
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
  final String? phoneCode;
  final String? phone;
  final String? fullName;
  final String? birthday;

  AgencyUser(
      {required this.id,
      required this.displayName,
      required this.phone,
      required this.phoneCode,
      required this.email,
      required this.pDoneId,
      required this.fullName,
      required this.birthday});

  factory AgencyUser.fromJson(Map<String, dynamic> json) =>
      _$AgencyUserFromJson(json);
}
